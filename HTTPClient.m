classdef HTTPClient < handle
    properties
        Timeout@uint16 scalar = 5
        Auth
        BaseUrl@char
        BaseHost
        UserAgent
        Headers = {}
        MediaType = 'application/json'
    end
    methods
        function client = HTTPClient(varargin)
           if nargin == 0
               error('Base url required.');
           end

            baseUrl = varargin{1};
            client.BaseUrl = baseUrl; 
        end
        
        function AddHeader(obj,name,value)
            [i, ~] = size(obj.Headers);
            obj.Headers{i + 1,1} = name;
            obj.Headers{i + 1,2} = value;
        end
        
        function data = Execute(obj, request)
            opt = weboptions();
            opt.ArrayFormat = 'json';
            
            url = [obj.BaseUrl, request.Resource];
            
            if (~isempty(obj.Auth))
                opt.Username = obj.Auth.Username;
                opt.Password = obj.Auth.Password;
            end
            
            opt.HeaderFields = obj.Headers;
            opt.MediaType = obj.MediaType;
            
            switch (request.Method)
                case Method.GET
                    reqParams = sprintf(',''%s'',''%s''', request.Parameters{:});     
                    data = eval(['webread(url', reqParams, ')']);                                                         
                case Method.POST
                    if (isempty(request.Parameters))
                        data = webwrite(url, request.Body,opt);
                    elseif (~isempty(request.Body))
                        data = webwrite(url, request.Body);
                    else
                        req = cell2struct({request.Parameters{2:2:end}}, {request.Parameters{1:2:end}}, 2);
                        data = webwrite(url, req, opt);
                    end
            end
        end
    end
end