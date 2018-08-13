import { sp, Web } from './lib/sp';
import * as $ from 'jquery';
import { ItemAddResult, ItemUpdateResult } from 'sp-pnp-js/lib/pnp';
import { validateForm } from './validation';

declare var google;

const input = document.getElementById('address');
new google.maps.places.Autocomplete(input, null);

interface PersonalDetailsSubmission {
  Title: string;
  Name: string;
  Employee_x0020_Number: string;
  Address: string;
  Postcode: string;
  Phone: string;
  Email: string;
  Effective_x0020_Date: Date;
  Emergency_x0020_Name: string;
  Emergency_x0020_Address: string;
  Emergency_x0020_Relationship: string;
  Emergency_x0020_Work_x0020_Phone: string;
  Emergency_x0020_Mobile_x0020_Pho: string;
  Emergency_x0020_Home_x0020_Phone: string;
  Bank_x0020_Name: string;
  Bank_x0020_Account_x0020_Number: string;
  Bank_x0020_Sort_x0020_Code: string;
  Bank_x0020_Effective_x0020_Date: Date;
  Marriage_x0020_Title: string;
  Marriage_x0020_Surname: string;
  Line_x0020_ManagerId: string;
}

const saveForm = (submission: PersonalDetailsSubmission) => {
  console.log(submission);
  sp.web.lists
    .getByTitle('Personal Details')
    .items.add(submission)
    .then((iar: ItemAddResult) => {
      console.log(iar);
    });
};


$(document).on('click','#submitPersonalDetails', async () => {

  if (validateForm()) {
    const lineManagerInfo = JSON.parse($('#LineManager_TopSpan_HiddenInput').val() as string);
    let lineManagerId = '';

    await sp.web.siteUsers.getByLoginName (
      lineManagerInfo[0].Key).get().then((result) => {
        console.log(result.Id);
        lineManagerId = result.Id as string;
      });

    const inputData : PersonalDetailsSubmission = {
      Title: $('#Name').val() as string,
      Name: $('#name').val() as string,
      Employee_x0020_Number: $('#employee-number').val() as string,
      Address: $('#address').val() as string,
      Postcode: $('#postcode').val() as string,
      Phone: $('#telephone-number').val() as string,
      Email: $('#personal-email').val() as string,
      Effective_x0020_Date: new Date($('#effective-date').val() as string),
      Emergency_x0020_Name: $('#emergency-name').val() as string,
      Emergency_x0020_Address: $('#emergency-address').val() as string,
      Emergency_x0020_Relationship: $('#emergency-relationship').val() as string,
      Emergency_x0020_Work_x0020_Phone: $('#work-phone').val() as string,
      Emergency_x0020_Mobile_x0020_Pho: $('#mobile-phone').val() as string,
      Emergency_x0020_Home_x0020_Phone: $('#home-phone').val() as string,
      Bank_x0020_Name: $('#bank-name').val() as string,
      Bank_x0020_Account_x0020_Number: $('#bank-account-number').val() as string,
      Bank_x0020_Sort_x0020_Code: $('#bank-sort-code').val() as string,
      Bank_x0020_Effective_x0020_Date: new Date($('#bank-effective-date').val() as string),
      Marriage_x0020_Title: $('#marriage-title').val() as string,
      Marriage_x0020_Surname: $('#marriage-surname').val() as string,
      Line_x0020_ManagerId: lineManagerId,
    };

    saveForm(inputData);
    $('.form-panel').hide();
    $('.completed-panel').show();
  }
});
