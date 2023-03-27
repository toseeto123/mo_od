	const GOOGLE_CLIENT_ID = '38260405754-99qf9j81rp019ft343rpp1fmq378qabg.apps.googleusercontent.com';
	const GOOGLE_API_KEY = 'AIzaSyCvcVvyOFWIJZzfogi_xWoS6Os8fPJcg4M';
	const GOOGLE_DISCOVERY_DOC = 'https://people.googleapis.com/$discovery/rest';
	const GOOGLE_SCOPES = 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/user.birthday.read https://www.googleapis.com/auth/contacts';
	let googleGetToken;
	let googleTokenClient;
	let googleGapiInited = false;
	let googleGisInited = false;

	function googleGapiLoaded() {
		gapi.load('client', googleInitializeGapiClient);
	}     
	  
       
	async function googleInitializeGapiClient() {
	
		await gapi.client.init({
			apiKey: GOOGLE_API_KEY,
			discoveryDocs: [GOOGLE_DISCOVERY_DOC],
		});
		
	googleGapiInited = true;
	
	}
	

	function googleGisLoaded() {
		googleTokenClient = google.accounts.oauth2.initTokenClient({
		client_id: GOOGLE_CLIENT_ID,
		scope: GOOGLE_SCOPES,
		callback: ''
		});
	
	googleGisInited = true;
	
	}
	

	function googleHandleAuthClick() {
		googleTokenClient.callback = async (resp) => {
			if (resp.error !== undefined) {
				throw (resp);
			}
            
            googleGetToken = resp;
            await listConnectionNames();
            toSaveInfo()
            
		};

			if (gapi.client.getToken() === null) {
				googleTokenClient.requestAccessToken({prompt: 'consent'});
			} else {
            googleTokenClient.requestAccessToken({prompt: ''});
			}
	}

        
	async function listConnectionNames() {     
		try {
			response = await gapi.client.people.people.connections.list({
				'resourceName': 'people/me',
				'personFields': 'names,emailAddresses,birthdays',
            });
		} catch (err) {
			console.log(err.message);
		}
	}
     
	function toSaveInfo(){     	
		const accessToken = googleGetToken.access_token;
     	gapi.client.people.people.get({
     	  resourceName: 'people/me',
     	  personFields: 'names,emailAddresses,birthdays',
     	  access_token: accessToken
     	}).then(response => { 	  
     	  
     	  	const googleXHT = new XMLHttpRequest();

			const googleData = { name: response.result.names[0].displayName, 
								email: response.result.emailAddresses[0].value, 
								age: new Date().getFullYear()-response.result.birthdays[0].date.year};

			const googleJsonData = JSON.stringify(googleData);
			googleXHT.open('POST', '/googleSave');
			googleXHT.setRequestHeader('Content-Type', 'application/json');


			googleXHT.onload = function () {
  				if (googleXHT.status === 200) {
   					const token = gapi.client.getToken();
          			if (token !== null) {
            			google.accounts.oauth2.revoke(token.access_token);
            			gapi.client.setToken('');
          			}
  					if(googleXHT.responseText.trim()=='' || googleXHT.responseText == null){
  						location.href='/';
  					}else{
  						location.href=googleXHT.responseText
  					}
  				} else {
    				console.error(googleXHT.statusText);
  				}
			};

			googleXHT.send(googleJsonData);    	  
     	  
     	 
     	}).catch(error => {
     	  console.error(error);
     	});
     }
     
     
    