using cafe_classLib;

Console.WriteLine("Hello, World!");


AnsatteRepository dbConnecter = new AnsatteRepository();
dbConnecter.ConnectToDB();

dbConnecter.Create(1, "testuser", 12345678, 1);

dbConnecter.Read(1);

dbConnecter.Update(1, "updateduser", 87654321, 2);

//dbConnecter.Delete(1);

dbConnecter.DisconnectFromDB();
