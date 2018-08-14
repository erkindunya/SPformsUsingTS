import { sp, Web } from './lib/sp';
import * as $ from 'jquery';
import { ItemAddResult, ItemUpdateResult } from 'sp-pnp-js/lib/pnp';
import { validateForm } from './validation';

// declare var google;

// const input = document.getElementById('address');
// new google.maps.places.Autocomplete(input, null);

// const emergencyinput = document.getElementById('emergency-address');
// new google.maps.places.Autocomplete(emergencyinput, null);

interface PersonalDetailsSubmission {
  Title: string;
  Name: string;
  Employee_x0020_Number: string;
  Address: string;
  Address_x0020_Line_x0020_2: string;
  Address_x0020_Line_x0020_3: string;
  Town_x0020__x002f__x0020_City: string;
  County: string;
  Postcode: string;
  Country: string;
  Phone: string;
  Email: string;
  Effective_x0020_Date: Date;
  Emergency_x0020_Name: string;
  Emergency_x0020_Address: string;
  Emergency_x0020_Address_x0020_Li: string;
  Emergency_x0020_Address_x0020_Li0: string;
  Emergency_x0020_Town_x0020__x002: string;
  Emergency_x0020_County: string;
  Emergency_x0020_Postcode: string;
  Emergency_x0020_Country: string;
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
      Address: $('#address-line-1').val() as string,
      Address_x0020_Line_x0020_2: $('#address-line-2').val() as string,
      Address_x0020_Line_x0020_3: $('#address-line-3').val() as string,
      Town_x0020__x002f__x0020_City: $('#town-city').val() as string,
      County: $('#county').val() as string,
      Postcode: $('#postcode').val() as string,
      Country: $('#country').val() as string,
      Phone: $('#telephone-number').val() as string,
      Email: $('#personal-email').val() as string,
      Effective_x0020_Date: new Date($('#effective-date').val() as string),
      Emergency_x0020_Name: $('#emergency-name').val() as string,
      Emergency_x0020_Address: $('#emergency-address-line-1').val() as string,
      Emergency_x0020_Address_x0020_Li: $('#emergency-address-line-2').val() as string,
      Emergency_x0020_Address_x0020_Li0: $('#emergency-address-line-3').val() as string,
      Emergency_x0020_Town_x0020__x002: $('#emergency-town-city').val() as string,
      Emergency_x0020_County: $('#emergency-county').val() as string,
      Emergency_x0020_Postcode: $('#emergency-postcode').val() as string,
      Emergency_x0020_Country: $('#emergency-country').val() as string,
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
