<?php
/**
 * https://jwt.io/introduction
 * Generate and validate JWT token in php
 * Without using third party library 
 * JWT Header
 * The header typically consists of two parts: 
 * The type of the token, which is JWT, and 
 * The signing algorithm being used, such as HMAC SHA256 or RSA.
 * {
 *  "alg": "HS256",
 *   "typ": "JWT"
 * }
 * Then, this JSON is Base64Url encoded to form the first part of the JWT.
 * JWT Payload
 * {
 * "sub": "1234567890",
 * "name": "John Doe",
 * "admin": true
 * }
 * JWT Signature
 * To create the signature part you have to take the encoded header,
 * The encoded payload, a secret, the algorithm specified in the header, and sign that.
 * HMACSHA256(
 * base64UrlEncode(header) + "." +
 * base64UrlEncode(payload),
 * secret)
 */

class GenerateJwtToken {

    /**
     * Generate JWT Token
     * Parameters
     * $header, $payload,$secret
     */
     
    public function generate_jwt($headers, $payload, $secret = 'secret') {
        $headers_encoded = $this->base64url_encode(json_encode($headers));
        
        $payload_encoded = $this->base64url_encode(json_encode($payload));
        
        $signature = hash_hmac('SHA256', "$headers_encoded.$payload_encoded", $secret, true);
        $signature_encoded = $this->base64url_encode($signature);
        
        $jwt = "$headers_encoded.$payload_encoded.$signature_encoded";
        
        return $jwt;
    }

    /**
     * Base64-URL encoded function
     */

    public function base64url_encode($str) {
        return rtrim(strtr(base64_encode($str), '+/', '-_'), '=');
    }

    /**
     * Check and validate user token when send request
     * Using token as header
     */

    public function is_jwt_valid($jwt, $secret = 'secret') {
        // split the jwt
        $tokenParts = explode('.', $jwt);
        $header = base64_decode($tokenParts[0]);
        $payload = base64_decode($tokenParts[1]);
        $signature_provided = $tokenParts[2];
    
        // check the expiration time - note this will cause an error if there is no 'exp' claim in the jwt
        $expiration = json_decode($payload)->exp;
        $is_token_expired = ($expiration - time()) < 0;
    
        // build a signature based on the header and payload using the secret
        $base64_url_header = $this->base64url_encode($header);
        $base64_url_payload = $this->base64url_encode($payload);
        $signature = hash_hmac('SHA256', $base64_url_header . "." . $base64_url_payload, $secret, true);
        $base64_url_signature = $this->base64url_encode($signature);
    
        // verify it matches the signature provided in the jwt
        $is_signature_valid = ($base64_url_signature === $signature_provided);
        
        if ($is_token_expired || !$is_signature_valid) {
            return FALSE;
        } else {
            return TRUE;
        }
    }
}

$jwt_object = new GenerateJwtToken();
$headers = array('alg'=>'HS256','typ'=>'JWT');
$payload = array('sub'=>'1234567890','name'=>'John Doe', 'admin'=>true, 'exp'=>(time() + 60));

$jwt = $jwt_object->generate_jwt($headers, $payload);
echo $jwt;

$is_jwt_valid = $jwt_object->is_jwt_valid('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImV4cCI6MTY1MDY5MzI0OX0.DdfIzXsVs5sLp2sng12hLhGzxxPjXztc-ZlqeLvJDcA');

echo nl2br("\n");

if($is_jwt_valid === TRUE) {
	echo 'JWT is valid';
} else {
	echo 'JWT is invalid';
}
/**
 * Important Notes
 * What is JSON Web Token?
 * 
 * JSON Web Token (JWT) is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object.
 * This information can be verified and trusted because it is digitally signed. 
 * JWTs can be signed using a secret (with the HMAC algorithm) or a public/private key pair using RSA or ECDSA.
 * 
 * Although JWTs can be encrypted to also provide secrecy between parties, we will focus on signed tokens.
 * Signed tokens can verify the integrity of the claims contained within it, while encrypted tokens hide those claims from other parties.
 * When tokens are signed using public/private key pairs, the signature also certifies that only the party holding the private key is the one that signed it.
 * 
 * When should you use JSON Web Tokens?
 * 
 * Once the user is logged in, each subsequent request will include the JWT, allowing the user to access routes, services, and resources that are permitted with that token.
 * JSON Web Tokens are a good way of securely transmitting information between parties.
 * 
 * What is the JSON Web Token structure?
 * 
 * In its compact form, JSON Web Tokens consist of three parts separated by dots (.), which are:
 * Header, Payload, Signature ,Therefore, a JWT typically looks like the following.
 * xxxxx.yyyyy.zzzzz
 * Header --- The header typically consists of two parts: the type of the token, which is JWT, and the signing algorithm being used, such as HMAC SHA256 or RSA.
 * {
 *  "alg": "HS256",
 *   "typ": "JWT"
 * }
 * This JSON is Base64Url encoded to form the first part of the JWT.
 * 
 * Payload --- The second part of the token is the payload, which contains the claims. Claims are statements about an entity (typically, the user) and additional data. There are three types of claims: registered, public, and private claims.
 * 
 * Registered claims: These are a set of predefined claims which are not mandatory but recommended, to provide a set of useful, interoperable claims. Some of them are: iss (issuer), exp (expiration time), sub (subject), aud (audience), and others.
 * Public claims: These can be defined at will by those using JWTs. 
 * Private claims: These are the custom claims created to share information between parties that agree on using them and are neither registered or public claims.
 * 
 * {
 * "sub": "1234567890",
 * "name": "John Doe",
 * "admin": true
 * }
 * The payload is then Base64Url encoded to form the second part of the JSON Web Token.
 * 
 * Signature --- To create the signature part you have to take the encoded header, the encoded payload, a secret, the algorithm specified in the header, and sign that.
 * HMACSHA256(
 * base64UrlEncode(header) + "." +
 * base64UrlEncode(payload),
 * secret)
 * The signature is used to verify the message wasn't changed along the way, and, in the case of tokens signed with a private key, it can also verify that the sender of the JWT is who it says it is.
 * 
 * How do JSON Web Tokens work?
 * 
 * In authentication, when the user successfully logs in using their credentials, a JSON Web Token will be returned.
 * Since tokens are credentials, great care must be taken to prevent security issues.
 * In general, you should not keep tokens longer than required.
 * Whenever the user wants to access a protected route or resource, the user agent should send the JWT,
 * Typically in the Authorization header using the Bearer schema.
 * Authorization: Bearer <token>
 * The server's protected routes will check for a valid JWT in the Authorization header, and if it's present, the user will be allowed to access protected resources. 
 * Note that if you send JWT tokens through HTTP headers, you should try to prevent them from getting too big. Some servers don't accept more than 8 KB in headers.
 * If the token is sent in the Authorization header, Cross-Origin Resource Sharing (CORS) won't be an issue as it doesn't use cookies.
 */

?>