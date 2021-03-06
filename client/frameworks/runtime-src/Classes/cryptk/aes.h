/* crypto/aes/aes.h -*- mode:C; c-file-style: "eay" -*- */
/* ====================================================================
* Copyright (c) 1998-2002 The OpenSSL Project.  All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
*
* 1. Redistributions of source code must retain the above copyright
*    notice, this list of conditions and the following disclaimer. 
*
* 2. Redistributions in binary form must reproduce the above copyright
*    notice, this list of conditions and the following disclaimer in
*    the documentation and/or other materials provided with the
*    distribution.
*
* 3. All advertising materials mentioning features or use of this
*    software must display the following acknowledgment:
*    "This product includes software developed by the OpenSSL Project
*    for use in the OpenSSL Toolkit. (http://www.openssl.org/)"
*
* 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be used to
*    endorse or promote products derived from this software without
*    prior written permission. For written permission, please contact
*    openssl-core@openssl.org.
*
* 5. Products derived from this software may not be called "OpenSSL"
*    nor may "OpenSSL" appear in their names without prior written
*    permission of the OpenSSL Project.
*
* 6. Redistributions of any form whatsoever must retain the following
*    acknowledgment:
*    "This product includes software developed by the OpenSSL Project
*    for use in the OpenSSL Toolkit (http://www.openssl.org/)"
*
* THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
* EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
* PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
* ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
* NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
* HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
* STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
* ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
* OF THE POSSIBILITY OF SUCH DAMAGE.
* ====================================================================
*
*/

#ifndef HEADER_AES_SELECTOR_H
#define HEADER_AES_SELECTOR_H

#include "cryptk_conf.h"

#ifdef OPENSSL_NO_AES
#error AES is disabled.
#endif

#if (_HAS_OPENSSL && _USING_OPENSSL_AES)

#ifdef _WIN32
  #if _BUILD_OPENSSL_AS_DLL
    #define EMBED_AES_API __declspec(dllimport)
  #else
    #define EMBED_AES_API
  #endif
#else
  #define EMBED_AES_API
#endif

#define ossl_aes_options  AES_options
#define ossl_aes_set_encrypt_key  AES_set_encrypt_key
#define ossl_aes_set_decrypt_key  AES_set_decrypt_key
#define ossl_aes_encrypt  AES_encrypt
#define ossl_aes_decrypt  AES_decrypt
#define ossl_aes_ecb_encrypt  AES_ecb_encrypt
#define ossl_aes_cbc_encrypt  AES_cbc_encrypt
#define ossl_aes_cfb128_encrypt  AES_cfb128_encrypt
#define ossl_aes_cfb1_encrypt  AES_cfb1_encrypt
#define ossl_aes_cfb8_encrypt  AES_cfb8_encrypt
#define ossl_aes_ofb128_encrypt  AES_ofb128_encrypt
#define ossl_aes_ctr128_encrypt  AES_ctr128_encrypt
#define ossl_aes_ige_encrypt  AES_ige_encrypt
#define ossl_aes_bi_ige_encrypt  AES_bi_ige_encrypt
#define ossl_aes_wrap_key
#define ossl_aes_unwrap_key

#else
#define EMBED_AES_API
#endif /* (_HAS_OPENSSL && _USING_OPENSSL_AES) */

#include <stddef.h>

#define AES_ENCRYPT    1
#define AES_DECRYPT    0

/* 
Because array size can't be a const in C, the following two are macros.
Both sizes are in bytes. 
@remark:
#1.AES_BLOCK_SIZE can be 32

#2.The iv equals AES_BLOCK_SIZE always

#3.AES KEY also can be 128bits or 256bits
*/
#define AES_MAXNR 14
#define AES_BLOCK_SIZE 16

#if (_HAS_OPENSSL && _USING_OPENSSL_AES)
#ifdef  __cplusplus
extern "C" {
#endif
#endif

    /* This should be a hidden type, but EVP requires that the size be known */
    struct aes_key_st {
#ifdef AES_LONG
        unsigned long rd_key[4 *(AES_MAXNR + 1)];
#else
        unsigned int rd_key[4 *(AES_MAXNR + 1)];
#endif
        int rounds;
    };
    typedef struct aes_key_st AES_KEY;

    // const char *ossl_aes_options(void);

    EMBED_AES_API int ossl_aes_set_encrypt_key(const unsigned char *userKey, const int bits,
        AES_KEY *key);
    EMBED_AES_API int ossl_aes_set_decrypt_key(const unsigned char *userKey, const int bits,
        AES_KEY *key);

    EMBED_AES_API void ossl_aes_encrypt(const unsigned char *in, unsigned char *out,
        const AES_KEY *key);
    EMBED_AES_API void ossl_aes_decrypt(const unsigned char *in, unsigned char *out,
        const AES_KEY *key);

    EMBED_AES_API void ossl_aes_ecb_encrypt(const unsigned char *in, unsigned char *out,
        const AES_KEY *key, const int enc);
    EMBED_AES_API void ossl_aes_cbc_encrypt(const unsigned char *in, unsigned char *out,
        size_t length, const AES_KEY *key,
        unsigned char *ivec, const int enc);
    EMBED_AES_API void ossl_aes_cfb128_encrypt(const unsigned char *in, unsigned char *out,
        size_t length, const AES_KEY *key,
        unsigned char *ivec, int *num, const int enc);
    EMBED_AES_API void ossl_aes_cfb1_encrypt(const unsigned char *in, unsigned char *out,
        size_t length, const AES_KEY *key,
        unsigned char *ivec, int *num, const int enc);
    EMBED_AES_API void ossl_aes_cfb8_encrypt(const unsigned char *in, unsigned char *out,
        size_t length, const AES_KEY *key,
        unsigned char *ivec, int *num, const int enc);
    EMBED_AES_API void ossl_aes_ofb128_encrypt(const unsigned char *in, unsigned char *out,
        size_t length, const AES_KEY *key,
        unsigned char *ivec, int *num);
    EMBED_AES_API void ossl_aes_ctr128_encrypt(const unsigned char *in, unsigned char *out,
        size_t length, const AES_KEY *key,
        unsigned char ivec[AES_BLOCK_SIZE],
        unsigned char ecount_buf[AES_BLOCK_SIZE],
        unsigned int *num);
    /* NB: the IV is _two_ blocks long */
    EMBED_AES_API void ossl_aes_ige_encrypt(const unsigned char *in, unsigned char *out,
        size_t length, const AES_KEY *key,
        unsigned char *ivec, const int enc);
    /* NB: the IV is _four_ blocks long */
    EMBED_AES_API void ossl_aes_bi_ige_encrypt(const unsigned char *in, unsigned char *out,
        size_t length, const AES_KEY *key,
        const AES_KEY *key2, const unsigned char *ivec,
        const int enc);
    //
    //_OSSL_DLL int ossl_aes_wrap_key(AES_KEY *key, const unsigned char *iv,
    //		unsigned char *out,
    //		const unsigned char *in, unsigned int inlen);
    //_OSSL_DLL int ossl_aes_unwrap_key(AES_KEY *key, const unsigned char *iv,
    //		unsigned char *out,
    //		const unsigned char *in, unsigned int inlen);

#if (_HAS_OPENSSL && _USING_OPENSSL_AES)
#ifdef  __cplusplus
}
#endif
#endif

#endif /* !HEADER_AES_H */
