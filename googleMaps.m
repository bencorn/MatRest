%% HTTP GET Example

client = HTTPClient('https://maps.googleapis.com/maps/api');
% client.Auth = Authenticator(username,password);

req = Request('/directions/json', Method.GET);

% adds to POST or URL querystring based on Method
req.AddParameter('origin','75 9th Ave, New York, NY');
req.AddParameter('destination','461 Park Drive, Boston, MA 02215');
req.AddParameter('mode','driving');
req.AddParameter('key','AIzaSyA_YH5dpJL89Qi99M26-i_u4pAnB8cP7tE');

% execute the request
client.Execute(req);

%% HTTP POST Example

client = HTTPClient('http://smartloo.azurewebsites.net/api');
% client.Auth = Authenticator(username,password);

req = Request('/sensor_data/update', Method.POST);

% adds data structure as body to HTTP Request, encoding it to JSON
req.Body = struct('building','PHO','location','1FLOORW','sensorId',302,'value',50,'battery',100);

client.Execute(req);
