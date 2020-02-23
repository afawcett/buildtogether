public with sharing class NaturalLanguageFormDataSource  extends VisualEditor.DynamicPickList {

    private VisualEditor.DesignTimePageContext context;

    public NaturalLanguageFormDataSource(VisualEditor.DesignTimePageContext context) {
       this.context = context;
    }

    public override VisualEditor.DataRow getDefaultValue(){
        NaturalLanguageForm__mdt form = new NaturalLanguageFormSelector().getDefault(context.entityName);        
        return form!=null ? new VisualEditor.DataRow(form.MasterLabel, form.DeveloperName) : null;
    }
    
    public override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows  values = new VisualEditor.DynamicPickListRows();
        for( NaturalLanguageForm__mdt form : 
            new NaturalLanguageFormSelector().selectAll(context.entityName)) {
            values.addRow(new VisualEditor.DataRow(form.MasterLabel, form.DeveloperName));
        }
        return values;
    }
}
