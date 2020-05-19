/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dominio;

/**
 *
 * @author leandro
 */
public class Funcionario {
    private String login, senha;
    private String id;
    private String nickname;

    public Funcionario(String login, String senha, String id, String nickname) {
        this.login = login;
        this.senha = senha;
        this.id = id;
        this.nickname = nickname;
    }
    
    public String getNickname(){
        return nickname;
    }
    public void setNickname(String nickname){
        
    }

    public Funcionario() {
      
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

}
