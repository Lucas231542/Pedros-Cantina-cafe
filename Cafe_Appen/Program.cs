
using cafe_classLib;

Console.WriteLine("Hello, World!");


AnsatteRepository ansatteRepository = new AnsatteRepository();





ansatteRepository.Create("wfewe", 1323241, true, false);
ansatteRepository.Update(1, "Mads", 87654321, false, true);
ansatteRepository.Delete(7);

//ansatteRepository.Create(1, "wwfe", 13245653, 1);
foreach (Ansatte a in ansatteRepository.ReadAll())
{
    Console.WriteLine(a);
}






