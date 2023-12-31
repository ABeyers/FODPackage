import Foundation

extension URLComponents {
  private static let randomCollection: [URLComponents] = [
    "https://youku.com/non/lectus/aliquam/sit/amet/diam/in.png",
    "https://amazon.co.jp/nisl/aenean.json",
    "https://phoca.cz/ut.jsp",
    "https://patch.com/fringilla/rhoncus/mauris/enim/leo/rhoncus.js",
    "https://msn.com/et/commodo/vulputate/justo/in/blandit.jsp",
    "http://nbcnews.com/justo/sit/amet.aspx",
    "https://mapquest.com/nunc.xml",
    "http://reddit.com/nec.xml",
    "http://blog.com/penatibus/et/magnis/dis/parturient/montes/nascetur.json",
    "https://parallels.com/dapibus/augue/vel/accumsan/tellus/nisi.png",
    "https://sciencedirect.com/morbi/a/ipsum/integer.json",
    "http://cdc.gov/rhoncus/sed/vestibulum/sit/amet.aspx",
    "http://surveymonkey.com/duis/faucibus/accumsan/odio/curabitur.jsp",
    "https://acquirethisname.com/morbi/vestibulum/velit.json",
    "https://shareasale.com/lacus/morbi/sem/mauris/laoreet/ut.js",
    "https://oracle.com/semper/est/quam.js",
    "http://pinterest.com/magnis/dis.aspx",
    "https://walmart.com/nisl.xml",
    "https://1688.com/aliquam/erat/volutpat/in/congue/etiam/justo.jsp",
    "http://altervista.org/curabitur/convallis.json",
    "http://google.co.jp/integer.jpg",
    "http://comcast.net/libero/quis/orci.jpg",
    "https://stumbleupon.com/eget/vulputate/ut/ultrices/vel/augue.aspx",
    "http://deliciousdays.com/hac/habitasse/platea/dictumst/maecenas.js",
    "http://twitter.com/etiam/faucibus/cursus/urna.jsp",
    "https://europa.eu/pede/libero/quis.json",
    "http://wix.com/platea/dictumst/etiam/faucibus.aspx",
    "http://va.gov/purus/sit/amet/nulla/quisque.png",
    "http://reverbnation.com/ultrices/posuere/cubilia/curae/donec.aspx",
    "https://sourceforge.net/quis/odio/consequat/varius/integer/ac.aspx",
    "https://geocities.com/nonummy/integer/non/velit/donec/diam/neque.html",
    "https://ed.gov/et/eros/vestibulum/ac/est/lacinia/nisi.js",
    "https://google.com.hk/sapien/sapien/non/mi/integer/ac.json",
    "https://rambler.ru/lacinia/erat/vestibulum/sed/magna/at.aspx",
    "https://hud.gov/pede/justo/eu/massa/donec.png",
    "https://is.gd/aliquet/pulvinar/sed/nisl/nunc/rhoncus.js",
    "https://nbcnews.com/integer/aliquet.aspx",
    "http://google.it/sollicitudin.jsp",
    "http://census.gov/dignissim/vestibulum/vestibulum/ante/ipsum/primis/in.aspx",
    "https://typepad.com/magna/at/nunc/commodo/placerat.xml",
    "http://tinypic.com/ipsum/primis/in/faucibus/orci/luctus.aspx",
    "https://engadget.com/leo/odio/porttitor/id.jpg",
    "https://delicious.com/viverra/pede.jsp",
    "http://behance.net/consequat/ut/nulla/sed.html",
    "https://shop-pro.jp/odio.aspx",
    "https://wikipedia.org/quis/orci/nullam/molestie.json",
    "https://usa.gov/in/porttitor/pede.jpg",
    "http://engadget.com/ipsum.js",
    "https://msn.com/est/congue/elementum/in/hac/habitasse/platea.xml",
    "https://github.io/at/dolor.js",
    "https://dedecms.com/semper/interdum/mauris/ullamcorper/purus.json",
    "http://uol.com.br/porttitor/lacus/at/turpis/donec/posuere/metus.aspx",
    "https://blinklist.com/nonummy.xml",
    "http://google.it/eleifend/pede.html",
    "https://yahoo.com/bibendum/imperdiet.aspx",
    "http://paginegialle.it/non/velit/nec/nisi/vulputate/nonummy.js",
    "https://joomla.org/fusce/congue.json",
    "https://squidoo.com/sit/amet/lobortis/sapien/sapien.xml",
    "http://icq.com/morbi/sem/mauris/laoreet/ut/rhoncus.json",
    "http://newsvine.com/sem.png",
    "http://youtu.be/dolor/quis.jpg",
    "https://php.net/id/massa/id/nisl/venenatis/lacinia.jsp",
    "http://bloglines.com/ligula/in/lacus/curabitur.js",
    "https://smugmug.com/sollicitudin/ut/suscipit/a.jsp"
  ].map(URLComponents.init(string:)).map { $0! }
  static func random() -> Self {
    randomCollection.randomElement()!
  }
}
