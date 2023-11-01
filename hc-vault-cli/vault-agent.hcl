vault {
   address = "$VAULT_ADDR"
   tls_skip_verify = true
}

auto_auth {
   method {
      type = "token_file"
      config = {
         token_file_path = "/Users/tgruenert/.vault-token"
      }
   }
   sink "file" {
      config = {
            path = "/Users/tgruenert/vault-token-via-agent"
            mode= 0640
      }
   }
}
