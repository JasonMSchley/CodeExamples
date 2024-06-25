public with sharing class AccountDetailSpecificController{
    public Account account { get; private set; }
    public Boolean isPdf { get; private set; }
    public String aboutMe { get; private set; }
    public String greeting { get; private set; }
    public Boolean showGreeting { get; private set; }

    // Hardcoded Account ID (replace with your specific Account ID)
    private final Id ACCOUNT_ID = '001bm00000Dng1pAAB';

    public AccountDetailSpecificController() {
        account = [SELECT Id, Name, Phone, Industry, Type, AnnualRevenue, Website 
                   FROM Account 
                   WHERE Id = :ACCOUNT_ID 
                   LIMIT 1];
   
        //Define the "About Me" based on the language
        String language = UserInfo.getLanguage().substring(0, 2);
        switch on language {
            when 'es' {
                aboutMe = 'Soy un desarrollador apasionado con experiencia en Salesforce y desarrollo de aplicaciones web. Me encanta aprender nuevas tecnologías y resolver problemas complejos.';
            }
            when 'ja' {
                aboutMe = '私はSalesforceとWebアプリケーション開発の経験を持つ情熱的な開発者です。新しい技術を学び、複雑な問題を解決することが大好きです。';
            }
            when else {
                aboutMe = 'I am a passionate developer with experience in Salesforce and web application development. I love learning new technologies and solving complex problems.';
            }
        }
        
        isPdf = ApexPages.currentPage().getParameters().get('isPdf') == 'true';
        showGreeting = false; // Initialize showGreeting to false
    }
    
    // Method to set the URL parameter and reload the page as PDF
    public PageReference downloadPdf() {
        PageReference pageRef = ApexPages.currentPage();
        pageRef.getParameters().put('isPdf', 'true');
        pageRef.setRedirect(true);
        return pageRef;
    }
      
    // Method to generate the greeting
    public void generateGreeting() {
        greeting = 'Hello, ' + account.Name + '!';
        showGreeting = true;
    }
}