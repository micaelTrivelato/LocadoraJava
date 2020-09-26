
package beans;

import java.io.Serializable;

public class Usuario implements Serializable{ 
    private String identificacao;
    private String senha;
    private String email;

    public Usuario() {    }

    public String getIdentificacao() {
        return identificacao;
    }

    public String getSenha() {
        return senha;
    }

    public void setIdentificacao(String identificacao) {
        this.identificacao = identificacao;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
   
    
}
