class Store {

  String judul;
  String gambar;

  Store.items({
    this.gambar,
    this.judul,
  });
}

List<Store> storeItems =[

    Store.items(
      gambar: "http://haitai.jp/img/all-secret-challenge_accepted.png",
      judul: "Challenge Accepted",
    ),
    Store.items(
      gambar: "http://haitai.jp/img/all-secret-consolation_prize.png",
      judul: "Consolation Prize",
    ),
    Store.items(
      gambar: "http://haitai.jp/img/all-secret-dancer.png",
      judul: "Non-Stop Dancer",
    ),
    Store.items(
      gambar: "http://haitai.jp/img/all-secret-improved.png",
      judul: "Most Improved",
    ),
    Store.items(
      gambar: "http://haitai.jp/img/all-secret-rank-s.png",
      judul: "S-Ranker",
    ),
    Store.items(
      gambar: "http://haitai.jp/img/all-secret-jack.png",
      judul: "Jack of All Trades",
    ),
    Store.items(
      gambar: "http://haitai.jp/img/all-secret-nonstop.png",
      judul: "Nonstop",
    ),
    Store.items(
      gambar: "http://haitai.jp/img/all-secret-obsessed.png",
      judul: "Obsessed",
    ),
    Store.items(
      gambar: "http://haitai.jp/img/all-secret-quick_draw.png",
      judul: "Quick Draw",
    ),
    Store.items(
      gambar: "http://haitai.jp/img/all-secret-jackpot.png",
      judul: "Jackpot",
    ),

];