using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;  // CollectionBase
using System.IO;




namespace WebApplication1
{
    [Serializable]
    public class Cart : CollectionBase
    {
        // Метод для добавления в коллекцию Cart объекта класса CartUnit
        public void Add(CartUnit newCartUnit)
        {
            List.Add(newCartUnit);
        }
        // Метод для удаления из коллекции Cart объекта класса CartUnit
        public void Remove(CartUnit newCartUnit)
        {
            List.Remove(newCartUnit);
        }
        /** Метод для получения индекса объекта класса CartUnit в коллекции Cart */
        public int IndexCartUnit(CartUnit newCartUnit)
        {
            return List.IndexOf(newCartUnit);
        }
        /** Метод для получения общего количества объектов класса CartUnit в коллекции Cart */
        public int CountCartUnit()
        {
            return List.Count;
        }
        /** Метод для удаления всех объектов CartUnit из коллекции Cart */
        public void DeleteAll()
        {
            List.Clear();
        }
        /** Метод, определяющий итератор коллекции Cart для использования в цикле forech */
        public CartUnit this[int Index]
        {
            get
            {
                return (CartUnit)List[Index];
            }
            set
            {
                List[Index] = value;
            }
        }             

    }
}