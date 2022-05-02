public class HandsOn4 {
//Atividade 1
    public static void getValue (Id parcelaId) {
        List<Parcela__c> parcelaList = [
        SELECT Id, DataPagamento__c, DataVencimento__c, Valor__c
        FROM Parcela__c
        WHERE Id := parcelaId       
        ];
    if (DataPagamento__c > DataVencimento__c ){
        Valor__c = Valor__c + Valor__c * 0,1;
    } else if (DataPagamento__c < DataVencimento__c){
        Valor__c = Valor__c - Valor__c * 0,05;
    } else if (DataPagamento__c === DataVencimento__c){
        Valor__c = Valor__c;
    } else {
        System.debug('Ops! Há algo errado, ligue para nossa central.');
    }
}
// Símbolo := aplica um filtro
//Atividade 2 
    public static void takeAction (Id accountId){
        List<Account> accountList = [
        SELECT Id, 	Active__c, Name, CNPJ, 	Description
        FROM Account
        WHERE Id := accountId
        ];
    if(Active__c == false){
        System.debug('Não é possível efetuar operações com clientes inativos.');
    } else if (Name == null || CNPJ == null || Description == null ){
        System.debug('Ops, você precisa preencher todos os campos.')
    } else {
        System.debug('Ops! Há algo errado, ligue para nossa central.');
    }
// AND = &&
// OR  = || 
}

//Atividade 3
    public static void doThis (Id accountId){
        List<Account> accountList2 = [
            SELECT Id, DadosBancarios__r.Account, Contato__r.Account
            FROM Account
            WHERE Id := accountId
        ];
    if(DadosBancarios__r.Account == null){
        System.debug('Não há registros de Dados Bancários!');
    } else if(Contato__r.Account == null ){
        System.debug('Não há Contato para esta Conta!');
    }else {
        Opportunity opp = new Opportunity(
            StageName = 'Closed Won', 
            Amount = 100,00
        );
        insert opp;
    }
}
//Para o item 3 existir, já consideramos que os itens 1 e 2 já são falsos
//Sendo assim, basta orientar o código a criar uma nova Oportunidade

//Atividade 4
    public static void criarCaso (Id accountId){
        List<Account> accountList3 = [
            SELECT Id, Active__c, Contato__r.Account, ContactId
            FROM Account
            WHERE Id := accountId
        ];
    if(Active__c == 'No'){
        System.debug('O cliente deve estar ativo para criar um caso.');
    } else if(Contato__r.Account == null){
        System.debug('É preciso haver um contato para o caso');
    } else {
        criarCaso();
    }
}

public static void criarCaso() {
    Case sinistro = new Case(
        Subject = ContactId + ' - Sinistro'
    );
    insert case;
}
