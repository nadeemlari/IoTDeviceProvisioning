registration_id=device-02
echo $registration_id
openssl genrsa -out ./private/device-02.key.pem 4096
openssl req -config ./openssl_device_intermediate_ca.cnf -key ./private/device-02.key.pem -subj /CN=device-02 -new -sha256 -out ./csr/device-02.csr.pem
openssl ca -batch -config ./openssl_device_intermediate_ca.cnf -passin pass:1234 -extensions usr_cert -days 3650 -notext -md sha256 -in ./csr/device-02.csr.pem -out ./certs/device-02.cert.pem
type device-02.cert.pem azure-iot-test-only.intermediate.cert.pem azure-iot-test-only.root.ca.cert.pem > device-02-full-chain.cert.pem