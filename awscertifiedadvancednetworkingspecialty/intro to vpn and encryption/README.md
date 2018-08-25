# Intro to VPN and Encryption
* Types of VPN
    * Site-to-site: two or more sites connected without any software on clients (example: MPLS)
    * Client-to-site: client has software that allows it to communicate with the site
* Keys
    * Symmetric-key encryption: All parties share the same key to encrypt and decrypt a message
    * Asymmetric-key (Public key) encryption: Each party has a public-private key pair. One computer uses its private key to encrypt a message and the other uses its public key to decrypt.
* Authentication and Key Exchange
    * RSA
        * Asymmetric keys, public and private.
        * Primarily used for key exchange in other protocols, such as SSL. For example, RSA is used to encrypt an AES key exchange. 
        * 2048 bit encryption or higher is considered secure as 1024 has been theorized to be cracked by NSA.
    * Diffie-Hellman
        * Faster than RSA
        * Used by AWS and many other providers
        * Provides Perfect Forward Secrecy (PFS)
    * Perfect Forward Secrecy (PFS)
        * The compromise of session does not endanger other sessions. New keys are created for every session.
    * Message Integrity
        * For verifying the authenticity of the message
        * MD5 (Message Digest)
            * Broken and should not be used in Production
        * SHA (Secure Hash Algorithm)
            * SHA-1: 160-bit hash similar to MD5. Considered insecure.
            * SHA-2: Includes SHA-256 and SHA-512
            * SHA-3: The only SHA not created by NSA.
    * Confidentiality / Encryption Protocols
        * Triple DES (3DES)
            * Three symmetric keys with 56 bits each
            * Slowly being phased out for stronger standards
        * Blowfish
            * Fast algorithm, secure
            * Blocks of 64 bits encrypted individually
        * Twofish
            * Successor to Blowfish
            * Keys can be up to 256 bits in length
            * One of the fastest algorithms
        * AES
            * Standard for US Govt and many other orgs
            * Symmetric key algorithm
            * Uses 128, 192 or 256 bit encryption
            * Widely regarded as the de-facto standard for message encryption
    * VPN Protocols
        * Point-to-Point Protocol (PPP)
            * Used to encrypt traffic within a tunnel
            * Layer 2
        * Point-to-Point Tunnelling Protocol (PPTP)
            * One of the first VPN protocols
            * Establishes a GRE tunnel. Then uses PPP to encrypt and authenticate the traffic.
            * Uses simple password authentication, considered insecure.
        * Layer 2 Tunneling Protocol (L2TP)
            * Combines LTP and PPTP to create a more secure protocol using IPSec. 
            * L2TP uses PPP to create the connection and IPSEC to encrypt it.
        * IKEv2 (Internet Key Exchange)
            * Faster than L2TP
            * Very fast to reconnect (great for mobile connections)
        * SSL VPN 
            * Can be initiated thru a browser / does not require client software
        * OpenVPN
            * Uses OpenSSL library (opensource)
            * Commonly considered the most secure VPN protocol
    * IPsec 
        * SA (Security Association)
            * Describes the security features of an IPsec connection
            * ex. ESP, AES, Diffie-Hellman, etc
        * AH (Authentication Header)
            * Guarantees connectionless integrity and data origin of IP packets
            * Authenticates the entire packet, with the exception of mutable fields (DSCP/ToS)
            * Does not encrypt the payload
        * ESP (Encapsulating Security Payload)
            * Provides encryption and authentication. 
            * Only authenticates the contents of the packet.    
        * Transport Mode
            * Encapsulates the payload of a packet
            * Used for most client to server relationships
        * Tunnel Mode
            * Encapsulates the entire IP packet
            * Used for most VPNs
    * IPsec Process
        * IKE Phase 1
            * Endpoints use ISAKMP (Internet Security Association and Key Management Protocol) to authenticate and negotiate keys. This creates an encrypted tunnel used by Phase 2 for negotiating the ESP security associations
            * Uses an authenticated Diffie-Hellman exchange to match the PSKs. 
            * Main Mode: The most secure. Provides complete security of the key exchange.
            * Aggressive Mode: Uses half the exchanges in the key exchange process, but transmits some information in cleartext.
        * IKE Key Exchange
            * The nodes must agree on all of the following: 
                * The encryption algorithm. (example: AES)
                * The bit-strength of the encryption key. (example: a Diffie-Hellman group)
                * The authentication method. (example: an RSA digital signature)
                * The hash algorithm. (usually SHA-1 or higher)
                * The authentication material. (usually a PSK)                
        * IKE Phase 2
            * The endpoints use the tunnel created in PHase 1 to negotiate ESP SAs. The ESP SAs encrypt the actual user data.
            * After phase 2, the tunnel is created and traffic can now pass thru.