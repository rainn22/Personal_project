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
    description:
        'This exquisite handmade vase is crafted from the finest clay and designed with intricate detailing to give it a unique, artistic flair. Whether used to hold fresh flowers, dried botanicals, or simply as a stand-alone decorative piece, this vase adds a touch of elegance and charm to any space. Ideal for gifting on special occasions or as a statement piece for your living room, this vase showcases the beauty of handcrafted craftsmanship.',
  ),
  ProductDetail(
    id: '2',
    name: 'Handmade Vase',
    price: 35.99,
    images: ['assets/handmade_vase2.jpg'],
    category: ProductCategories.artCrafts,
    tags: [Recipient.forHim, Recipient.forHer],
    stock: 10,
    description:
        'This elegant handmade vase stands out with its graceful curves and vibrant color, making it an ideal addition to any home decor. Carefully crafted by skilled artisans, the vase’s delicate design brings a sense of tranquility and sophistication to your living space. Its neutral tones make it versatile for different interior styles, whether modern, rustic, or contemporary. Perfect for displaying your favorite flowers or as an art piece on its own, it is a timeless gift that speaks volumes of thoughtfulness and beauty.',
  ),
  ProductDetail(
    id: '3',
    name: 'Crafting Paint Set',
    price: 12.99,
    images: ['assets/crafting_paint_set.jpg'],
    category: ProductCategories.artCrafts,
    tags: [Recipient.forKids, Recipient.forTeens],
    stock: 25,
    description:
        'Ignite your child’s creativity with this complete crafting paint set. Packed with vibrant colors and all the essential tools for budding artists, this set offers everything kids and teens need to create their own masterpieces. The high-quality paints are safe and non-toxic, making it perfect for all ages. Whether they’re working on school projects, personal art, or simply exploring their artistic potential, this set helps them develop motor skills, color recognition, and imagination. It’s a great activity for rainy days, playdates, or art classes.',
  ),
  ProductDetail(
    id: '4',
    name: 'Crafting Paint Set',
    price: 12.99,
    images: ['assets/crafting_paint_set2.jpg'],
    category: ProductCategories.artCrafts,
    tags: [Recipient.forKids, Recipient.forTeens],
    stock: 25,
    description:
        'Unleash your creative energy with this all-in-one crafting paint set. Designed for kids and teens, it features a wide selection of vibrant paint colors, brushes, and tools, all housed in a convenient case for easy storage and portability. The paints are smooth, bright, and long-lasting, allowing young artists to explore a variety of painting techniques. Whether it’s a DIY project or simply a way to relax and express themselves, this set encourages imaginative play and can provide hours of fun for artists of all skill levels.',
  ),

  //book
  ProductDetail(
    id: '5',
    name: 'The Great Adventure',
    price: 14.99,
    images: ['assets/great_adventure_book.jpg'],
    category: ProductCategories.books,
    tags: [Recipient.forTeens],
    stock: 50,
    description:
        'Join the protagonist in a journey of discovery and excitement in "The Great Adventure". This captivating book takes readers through a thrilling series of events, exploring themes of courage, friendship, and personal growth. Perfect for young readers and adults alike, this book is an unforgettable read that will keep you on the edge of your seat until the very last page.',
  ),
  ProductDetail(
    id: '6',
    name: 'The Art of Painting',
    price: 19.99,
    images: ['assets/art_of_painting_book.jpg'],
    category: ProductCategories.books,
    tags: [Recipient.forHim, Recipient.forHer],
    stock: 20,
    description:
        'For aspiring artists, "The Art of Painting" is an essential guide to mastering various painting techniques. This book offers in-depth lessons on using different mediums like oil paints, acrylics, and watercolors, as well as tips on composition, color theory, and brushwork. Whether you are a beginner or an experienced artist, this book will inspire and help refine your skills.',
  ),
];
