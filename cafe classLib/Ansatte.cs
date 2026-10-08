using System;
using System.Collections.Generic;
using System.Text;

namespace cafe_classLib
{
    public class Ansatte
    {
        // instans felter
        private int _ansatteID;
        private string _navn;
        private int _tlf;
        public bool _erRask;

        public bool _erLeder;


        // konstruktør

        public Ansatte() { }
        public Ansatte(int ansatteID, string navn, int tlf, bool ErRask, bool ErLeder)
        {
            _ansatteID = ansatteID;
            _navn = navn;
            _tlf = tlf;
            _erRask = ErRask;
            _erLeder = ErLeder;
            
        }



        // properties

        public int AnsatteID
        {
            get { return _ansatteID; }
            set { _ansatteID = value; }
        }

        public string Navn
        {
            get { return _navn; }
            set { _navn = value; }
        }

        public int Tlf
        {
            get { return _tlf; }
            set { _tlf = value; }
        }

        public bool ErRask
        {
            get { return _erRask; }
           set { _erRask = value; }
        }

        public bool ErLeder
        {
            get { return _erLeder; }
            set { _erLeder = value; }
        }


        // metode til at vise info om ansatte

        public override string ToString()
        {
            return $"AnsatteID: {_ansatteID}, Navn: {_navn}, Tlf: {_tlf}, status: {_erRask}, Erleder: {_erLeder}";
        }


    }
}
