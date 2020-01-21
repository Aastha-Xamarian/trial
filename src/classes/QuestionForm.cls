public class QuestionForm {
        @AuraEnabled 
        public string id { get; set; }
        @AuraEnabled 
        public integer questionType { get; set; }
        @AuraEnabled 
        public string question { get; set; }
        @AuraEnabled 
        public string Answer { get; set; }
        @AuraEnabled 
        public string optionSelected { get; set; }
        @AuraEnabled 
        public String options { get; set; }
        @AuraEnabled 
        public List<String> opts { get; set;}
         @AuraEnabled 
        public List<String> Alloptions { get; set;}
        
    }