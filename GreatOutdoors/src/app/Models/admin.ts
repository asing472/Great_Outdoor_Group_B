export class Admin
{
    
  id: number;
  adminID: string;
  adminName: string;
  email: string;
  password: string;
  lastModifiedDateTime: string;
  creationDateTime: string;

  constructor(ID: number, AdminID: string, AdminName: string, Email: string, Password: string, CreationDateTime: string, LastModifiedDateTime: string,)
  {
    this.id = ID;
    this.adminID = AdminID;
    this.adminName = AdminName;
    this.email = Email;
    this.password = Password;
    this.creationDateTime = CreationDateTime;
    this.lastModifiedDateTime = this.lastModifiedDateTime;
  }
}


