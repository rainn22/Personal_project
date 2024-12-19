import '../models/product_categories.dart';
import '../models/recipient.dart';
import '../models/product_detail.dart';

final productDetails = [
  // Art & Crafts Products
  ProductDetail(
    id: '1',
    name: 'Handmade Vase',
    price: 35.99,
    images: ['assets/handmade_vase.jpg'],
    category: ProductCategories.artCrafts,
    tags: [Recipient.forHim, Recipient.forHer],
    stock: 10,
    description: 'This exquisite handmade vase is crafted from the finest clay and designed with intricate detailing to give it a unique, artistic flair. Whether used to hold fresh flowers, dried botanicals, or simply as a stand-alone decorative piece, this vase adds a touch of elegance and charm to any space. Ideal for gifting on special occasions or as a statement piece for your living room, this vase showcases the beauty of handcrafted craftsmanship.',
  ),
  ProductDetail(
    id: '2',
    name: 'Handmade Vase',
    price: 35.99,
    images: ['assets/handmade_vase2.jpg'],
    category: ProductCategories.artCrafts,
    tags: [Recipient.forHim, Recipient.forHer],
    stock: 10,
    description: 'This elegant handmade vase stands out with its graceful curves and vibrant color, making it an ideal addition to any home decor. Carefully crafted by skilled artisans, the vase’s delicate design brings a sense of tranquility and sophistication to your living space. Its neutral tones make it versatile for different interior styles, whether modern, rustic, or contemporary. Perfect for displaying your favorite flowers or as an art piece on its own, it is a timeless gift that speaks volumes of thoughtfulness and beauty.',
  ),
  ProductDetail(
    id: '3',
    name: 'Crafting Paint Set',
    price: 12.99,
    images: ['assets/crafting_paint_set.jpg'],
    category: ProductCategories.artCrafts,
    tags: [Recipient.forKids, Recipient.forTeens],
    stock: 25,
    description: 'Ignite your child’s creativity with this complete crafting paint set. Packed with vibrant colors and all the essential tools for budding artists, this set offers everything kids and teens need to create their own masterpieces. The high-quality paints are safe and non-toxic, making it perfect for all ages. Whether they’re working on school projects, personal art, or simply exploring their artistic potential, this set helps them develop motor skills, color recognition, and imagination. It’s a great activity for rainy days, playdates, or art classes.',
  ),
  ProductDetail(
    id: '4',
    name: 'Crafting Paint Set',
    price: 12.99,
    images: ['assets/crafting_paint_set2.jpg'],
    category: ProductCategories.artCrafts,
    tags: [Recipient.forKids, Recipient.forTeens],
    stock: 25,
    description: 'Unleash your creative energy with this all-in-one crafting paint set. Designed for kids and teens, it features a wide selection of vibrant paint colors, brushes, and tools, all housed in a convenient case for easy storage and portability. The paints are smooth, bright, and long-lasting, allowing young artists to explore a variety of painting techniques. Whether it’s a DIY project or simply a way to relax and express themselves, this set encourages imaginative play and can provide hours of fun for artists of all skill levels.',
  ),

  // Books Products
  // ProductDetail(
  //   id: '5',
  //   name: 'The Great Gatsby',
  //   price: 9.99,
  //   images: ['assets/great_gatsby.jpg'],
  //   category: ProductCategories.books,
  //   tags: [Recipient.forTeens],
  //   stock: 50,
  //   description: 'A timeless classic, "The Great Gatsby" by F. Scott Fitzgerald is a profound exploration of the American Dream and its inevitable collapse. Set against the backdrop of the Jazz Age, this novel delves into the extravagant world of Jay Gatsby, a mysterious millionaire, and his obsession with Daisy Buchanan, a woman of beauty and grace who represents everything he desires but can never truly possess. This book invites readers to reflect on the consequences of wealth, love, and ambition in a world filled with excess and illusion.',
  // ),
  // ProductDetail(
  //   id: '6',
  //   name: 'Harry Potter and the Sorcerer\'s Stone',
  //   price: 15.99,
  //   images: ['assets/harry_potter_book.jpg'],
  //   category: ProductCategories.books,
  //   tags: [Recipient.forKids, Recipient.forTeens],
  //   stock: 40,
  //   description: 'Step into the magical world of Hogwarts School of Witchcraft and Wizardry in this enchanting tale by J.K. Rowling. "Harry Potter and the Sorcerer\'s Stone" follows the journey of a young boy named Harry Potter, who discovers on his 11th birthday that he is a wizard with a great destiny. Along with his friends Ron Weasley and Hermione Granger, Harry embarks on an adventure filled with magical creatures, dark forces, and secrets that will change the course of history. This book is the perfect starting point for readers of all ages to experience the magic and wonder of the Harry Potter series.',
  // ),
];
