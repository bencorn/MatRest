classdef Authenticator < handle
   properties
       Username
       Password
   end
   
   methods
       function auth = Authenticator(username, password)        
          auth.Username = username;
          auth.Password = password;          
       end
   end
end