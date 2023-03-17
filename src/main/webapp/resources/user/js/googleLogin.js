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

        /**
         * Callback after Google Identity Services are loaded.
         */
        function googleGisLoaded() {
        	googleTokenClient = google.accounts.oauth2.initTokenClient({
            client_id: GOOGLE_CLIENT_ID,
            scope: GOOGLE_SCOPES,
            callback: ''
            , // defined later
          });
        	googleGisInited = true;
        }

        

        /**
         *  Sign in the user upon button click.
         */
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
            // Prompt the user to select a Google Account and ask for consent to share their data
            // when establishing a new session.
            googleTokenClient.requestAccessToken({prompt: 'consent'});
          } else {
            // Skip display of account chooser and consent dialog for an existing session.
            googleTokenClient.requestAccessToken({prompt: ''});
          }
          
        }

        /**
         *  Sign out the user upon button click.
         */
        function googleHandleSignoutClick() {//로그아웃시 적용할것
          const token = gapi.client.getToken();
          if (token !== null) {
            google.accounts.oauth2.revoke(token.access_token);
            gapi.client.setToken('');
          }
        }

        /**
         * Print the display name if available for 10 connections.
         */
        async function listConnectionNames() {
         
          try {
            // Fetch first 10 files
            response = await gapi.client.people.people.connections.list({
              'resourceName': 'people/me',
              'personFields': 'names,emailAddresses,birthdays',
            });
          } catch (err) {
            console.log(err.message);
            return;
          }
        }
        

     function googleAuthenticate() {
  	    return gapi.auth2.getAuthInstance()
  	        .signIn({scope: "https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/calendar.readonly"})
  	        .then(function() { console.log("Sign-in successful"); },
  	              function(err) { console.error("Error signing in", err); });
  	  }
     
     function toSaveInfo(){
     	
     	const accessToken = googleGetToken.access_token;
     	const peopleApi = gapi.client.people;
     	peopleApi.people.get({
     	  resourceName: 'people/me',
     	  personFields: 'names,emailAddresses,birthdays',
     	  access_token: accessToken
     	}).then(response => {
     	var googleName = JSON.stringify(response.result.names[0].displayName);
     	var googleEmail = JSON.stringify(response.result.emailAddresses[0].value);
     	var googleBirth = JSON.stringify(response.result.birthdays[0].date.year);
     	var googleNow = new Date();
     	 
     	var googleAge = googleNow.getFullYear()-googleBirth;
     	  console.log(response.result.names[0].displayName);
     	  console.log(response.result.emailAddresses[0].value);
     	  console.log(response.result.birthdays[0].date.year);
     	  
     	  
     	  const googleXHT = new XMLHttpRequest();


const googleUrl = '/googleSave';


const googleData = { name: googleName, email:googleEmail, age:googleAge};

const googleJsonData = JSON.stringify(googleData);


googleXHT.open('POST', googleUrl);


googleXHT.setRequestHeader('Content-Type', 'application/json');


googleXHT.onload = function () {
  if (googleXHT.status === 200) {
   location.href=googleXHT.responseText
  } else {
    console.error(googleXHT.statusText);
  }
};

googleXHT.send(googleJsonData);







     	  
     	  
     	  
     	  
     	  
     	  
     	 
     	}).catch(error => {
     	  console.error(error);
     	});
     }
     
     
    