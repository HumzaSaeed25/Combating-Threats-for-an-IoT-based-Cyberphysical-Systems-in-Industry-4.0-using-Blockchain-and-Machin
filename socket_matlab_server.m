% Open Socket
ip = '127.0.0.1';
port = 50007;
fprintf('Socket openning @%s:%d ... ',ip,port);
t = tcpip(ip, port, 'NetworkRole','server');
fopen(t);
fprintf('Opened.\n');
tick = 0;
i=1;
while true
    % Read from socket (wait here)
    if t.BytesAvailable ~= 0
        data = fread(t, t.BytesAvailable);
        string = char(data)';
        
       % To make a predictions on a new value
        yfit = trainedModel.predictFcn(string);
        
        disp(string); % print-out
    end 

    % Send to socket 
    tx_data = [yfit];
    
    if (i<length(tx_data)+1)
        fwrite(t, tx_data(i));
        i=i+1;
    end
    
    % terminate 
    tick = tick + 1;
    if tick >= 30, break; end
    pause(1e-0);
end
% Close
fclose(t);
fprintf('Closed.\n');