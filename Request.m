classdef Request < handle
   properties
       Resource
       Body
       Headers = {};
       Parameters = {};
       Method
   end
   
   methods
       function request = Request(resource, method)
           request.Resource = resource;
           request.Method = method;
       end
       
       function AddBody(obj, body)
           obj.Body = jsonencode(body);
       end
       
       function AddHeader(obj, header, value)
          obj.Headers{end+1} = struct('header',header,'value',value);
       end
       
       function AddParameter(obj, name, value)
           obj.Parameters{end+1} = name;
           obj.Parameters{end+1} = value;
       end
   end
end