import { FormGroup, ValidationErrors } from '@angular/forms';

// Create By Prafull Sharma on 08/10/2019
export class GreatOutdoorComponentBase {
  getFormGroupErrors(formGroup: FormGroup) {
    Object.keys(formGroup.controls).forEach(key => {
      const controlErrors: ValidationErrors = formGroup.get(key).errors;
      if (controlErrors != null) {
        Object.keys(controlErrors).forEach(keyError => {
          console.log('Key control: ' + key + ', keyError: ' + keyError + ', err value: ', controlErrors[keyError]);
        });
      }
    });
  }
}


