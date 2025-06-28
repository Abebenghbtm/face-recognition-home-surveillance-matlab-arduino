 function Email()
a=imread('input.jpg');
gmail = 'negahbtm@gmail.com'; %Your GMail email address
% myaddress= 'negahbtm@gmail.com';
password = 'nn1234HH,'; %Your GMail password

% Then this code will set up the preferences properly:
setpref('Internet','E_mail',gmail);
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username',gmail);
setpref('Internet','SMTP_Password',password);

% Required on some machines
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
dt=datestr(now,'mmmm dd. yyyy HH:MM:SS.FFF AM');
% Send the email
sendmail('negahbtm@gmail.com','Face Detection/Recognition System',dt,'input.jpg' );
end