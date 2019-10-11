export class SalesPerson
{
  id: number;
  salesPersonID: string;
  salesPersonName: string;
  salesPersonMobile: string;
  email: string;
  password: string;
  creationDateTime: string;
  lastModifiedDateTime: string;

  constructor(ID: number, SalesPersonID: string, SalesPersonName: string, SalesPersonMobile: string, Email: string, Password: string, CreationDateTime: string, LastModifiedDateTime: string)
  {
    this.id = ID;
    this.salesPersonID = SalesPersonID;
    this.salesPersonName = SalesPersonName;
    this.salesPersonMobile = SalesPersonMobile;
    this.email = Email;
    this.password = Password;
    this.creationDateTime = CreationDateTime;
    this.lastModifiedDateTime = LastModifiedDateTime;
  }
}


