import { LightningElement, api, wire } from 'lwc';
import findForm from '@salesforce/apex/NaturalLanguageFormController.findForm';
import submitForm from '@salesforce/apex/NaturalLanguageFormController.submitForm';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class NaturalLanguageForm extends LightningElement {
    
    // Record id if on record page
    @api recordId;
    // Bindings to retrieve form metadata
    @api formName;
    @wire(findForm, { formName: '$formName' }) formComponents;

    clickAction({ target: { dataset: { id } } }) {
        // Extract form data
        const inputs = this.template.querySelectorAll('input');
        var formInputs = {};
        inputs.forEach(input => { 
            formInputs[input.dataset.id] = input.value;
        });
        if(this.recordId!=null) {
            formInputs.RecordId = this.recordId;
        }
        // Submit form data to Apex Controller to run associated Autolaunch Flow
        submitForm({ 
            action: id,
            fieldMapAsJSON : JSON.stringify(formInputs) })
        .then(result => {
            // Send toast confirmation to user
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Form Submission',
                    message: result,
                    variant: 'success',
                }));
        })
        .catch(error => {
            // Send toast confirmation to user
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Form Submission',
                    message : error.body.message,
                    variant: 'error',
                }));
        });                    
    }
}