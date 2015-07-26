# OpenVPN

```sh
brew cask install tunnelblick
```

## Certification

Server steps:

1. Generate a key of CA. 
2. Generate a self-signed certificate of CA.
3. Generate a key of the server.
4. Generate a certificate of the server signed by CA.

Client steps:

1. Generate a key of the client.
2. Generate a CSR and send it to CA.
3. (CA) Generate a certificate of the client and sent it to the client.

Common steps:

1. Generate a shared key as `ta.key`.
2. Generate a DH parameter as `dh.pem`.

### OpenSSL way

Generate a key.

```
% openssl genrsa -out client.key 4096
Generating RSA private key, 4096 bit long modulus
```

Generate a CSR.

```
% openssl req -new -key client.key -out client.csr
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:JP
State or Province Name (full name) [Some-State]:Tokyo
Locality Name (eg, city) []:.
Organization Name (eg, company) [Internet Widgits Pty Ltd]:.
Organizational Unit Name (eg, section) []:.
Common Name (e.g. server FQDN or YOUR name) []:client
Email Address []:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
```

