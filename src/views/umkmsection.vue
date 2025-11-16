<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
const router = useRouter()

const goDetail = (id) => {
  router.push(`/detail/${id}`)
}

const bxLogo = '/bx.png' 

const categories = [
  { label: 'Semua', value: 'Semua' },
  { label: 'Kuliner', value: 'Kuliner' },
  { label: 'Fashion', value: 'Fashion' },
  { label: 'Kerajinan', value: 'Kerajinan Tangan' },
  { label: 'Jasa', value: 'Jasa' }
]
const activeCategory = ref(categories[0])
const searchQuery = ref('')

// Data UMKM default
const defaultUmkmList = [
{
    id: 1,
    kapasitas: '10',
    nama_umkm: 'Warteg kokom',
    kategori: 'Menengah',
    jenis_usaha: 'Kuliner',
    deskripsi: 'Warteg Sikom merupakan usaha mikro yang bergerak di bidang kuliner, khususnya penyediaan makanan siap saji dengan konsep warung makan tradisional khas Indonesia. Usaha ini berfokus pada penyajian berbagai menu rumahan yang lezat, bergizi, dan terjangkau bagi masyarakat dari berbagai kalangan',
    provinsi: 'DKI Jakarta',
    map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3574.2037322915753!2d106.85523987448221!3d-6.1647152938225185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f5a5f2599ce5%3A0xfba64c46f132213a!2sWarteg%20Kokom!5e1!3m2!1sid!2sid!4v1763131114670!5m2!1sid!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade',
    google_maps_url: 'https://www.google.com/maps/place/Warteg+Kokom/@-6.1647153,106.8552399,821m/data=!3m2!1e3!4b1!4m6!3m5!1s0x2e69f5a5f2599ce5:0xfba64c46f132213a!8m2!3d-6.1647153!4d106.8578148!16s%2Fg%2F11c37h739j?entry=ttu&g_ep=EgoyMDI1MTExMS4wIKXMDSoASAFQAw%3D%3D',
    kota: 'Jakarta',
    alamat: 'Jl. F No.15A 7, RT.7/RW.10, Cemp. Baru, Kec. Kemayoran, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10650',
    jumlah_karyawan: '7',
    jam_operasional: 'Buka 24 jam',
    hari_operasional: 'Senin - Minggu',
    foto_utama: '/gese.jpeg',
    status: 'aktif',
    galeri_foto: ['/dalam.jpeg', '/kana.jpeg']
  },
  // ID 2
  {
    id: 2,
    kapasitas: '20',
    nama_umkm: 'Mie Ayam Pangsit Bakso Bayu Langit',
    kategori: 'Menengah',
    jenis_usaha: 'Kuliner',
    deskripsi: 'Menjual berbagai jenis mie ayam dan bakso',
    provinsi: 'Jawa Barat',
    map_url: 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3572.8907431305674!2d106.8209123!3d-6.3566056!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69edab39002df7%3A0xcd3c9767693bd363!2sMie%20Ayam%20Pangsit%20Bakso%20Banyu%20Langit!5e1!3m2!1sid!2sid!4v1763151548980!5m2!1sid!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade',
    google_maps_url: 'https://www.google.com/maps/place/Mie+Ayam+Pangsit+Bakso+Banyu+Langit/@-6.3566056,106.8209123,820m/data=!3m1!1e3!4m7!3m6!1s0x2e69edab39002df7:0xcd3c9767693bd363!8m2!3d-6.3566326!4d106.820965!10e9!16s%2Fg%2F11jdcj0jtl?entry=ttu&g_ep=EgoyMDI1MTExMS4wIKXMDSoASAFQAw%3D%3D',
    kota: 'Depok',
    alamat: 'Jl. Lapangan Merah No.38, Kukusan, Beji, Depok City, West Java 12640',
    jumlah_karyawan: '5',
    jam_operasional: '10:00 - 20:00',
    hari_operasional: 'Senin - Minggu',
    foto_utama: '/asa.jpeg',
    status: 'aktif',
    galeri_foto: ['/no.jpeg', '/asa.png', '/fuyu.jpeg']
  },
  // ID 3
  {
    id: 3,
    kapasitas: '10',
    nama_umkm: 'Mie Ayam Galang',
    kategori: 'Kecil',
    jenis_usaha: 'Kuliner',
    deskripsi: 'Menjual Mie ayam dan minuman',
    provinsi: 'Jawa Barat',
    kota: 'Depok',
    alamat: 'Jl. H. Kodja Raya No.16, Kukusan, Kecamatan Beji, Kota Depok, Jawa Barat 16425',
    jumlah_karyawan: '3',
    jam_operasional: '08:30 - 19:00',
    hari_operasional: 'Senin - Minggu',
    foto_utama: '/Utama.png',
    galeri_foto: ['/Sambal.png', '/Mie.png', '/Menu.png'],
    status: 'aktif',
    map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3572.841225963485!2d106.8175711116747!3d-6.363729647127252!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69eea083225beb%3A0x2691731eb4acb469!2sMie%20Ayam%20Galang!5e1!3m2!1sid!2sid!4v1763205349156!5m2!1sid!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade',
    google_maps_url: 'https://www.google.com/maps/place/Mie+Ayam+Galang/@-6.3637296,106.8175711,820m/data=!3m1!1e3!4m14!1m7!3m6!1s0x2e69eea083225beb:0x2691731eb4acb469!2sMie+Ayam+Galang!8m2!3d-6.3638839!4d106.8175288!16s%2Fg%2F11cn934src!3m5!1s0x2e69eea083225beb:0x2691731eb4acb469!8m2!3d-6.3638839!4d106.8175288!16s%2Fg%2F11cn934src?entry=ttu&g_ep=EgoyMDI1MTExMi4wIKXMDSoASAFQAw%3D%3D',
  },
  // ID 4
  {
    id: 4,
    kapasitas: '45',
    nama_umkm: 'Laundry Express Bersih Kilat',
    kategori: 'Kecil',
    jenis_usaha: 'Jasa',
    deskripsi: 'Jasa laundry kiloan & satuan',
    provinsi: 'DKI Jakarta',
    kota: 'Jakarta Selatan',
    alamat: 'Jl. Mampang Prapatan XI No.19, RT.7/RW.1, Tegal Parang, Kec. Mampang Prpt., Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12790',
    jumlah_karyawan: '10',
    jam_operasional: '08:00 - 21:00',
    hari_operasional: 'Senin - Sabtu',
    foto_utama: '/laundri.png',
    galeri_foto: ['/mesin.png', '/pagi.png'],
    status: 'aktif',
    map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3749.2074726645487!2d106.82861849999999!3d-6.250055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f3806018bb2d%3A0xf500932bc4781f7b!2sLAUNDRY%20KILOAN%20EXPRES%20MAMPANG%20PRAPATAN%20CLEANIC%20LAUNDRY%20PREMIUM!5e1!3m2!1sen!2sid!4v1763207290040!5m2!1sen!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade',
    google_maps_url: 'https://www.google.com/maps/place/LAUNDRY+KILOAN+EXPRES+MAMPANG+PRAPATAN+CLEANIC+LAUNDRY+PREMIUM/@-6.250055,106.8286185,861m/data=!3m2!1e3!4b1!4m6!3m5!1s0x2e69f3806018bb2d:0xf500932bc4781f7b!8m2!3d-6.250055!4d106.8286185!16s%2Fg%2F11r3w20952?entry=ttu&g_ep=EgoyMDI1MTExMi4wIKXMDSoASAFQAw%3D%3D',
  },
  // ID 5
  {
    id: 5,
    kapasitas: 'Relative',
    nama_umkm: 'Bengkel Berkah Motor',
    kategori: 'Kecil',
    jenis_usaha: 'Jasa',
    deskripsi: 'Bengkel motor yang melayani perbaikan, servis rutin, dan penjualan onderdil untuk berbagai jenis sepeda motor.',
    provinsi: 'DKI Jakarta',
    kota: 'Jakarta Pusat',
    alamat: '1, Jl. Menteng Raya No.48, RT.2/RW.7, Kb. Sirih, Kec. Menteng, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10340',
    jumlah_karyawan: '3',
    jam_operasional: '15:00 - 23:00, Jumat 15:00 - 22:00, Sabtu 14:30 - 22:30',
    hari_operasional: 'Senin - Sabtu',
    foto_utama: '/h.png',
    galeri_foto: ['/main.png', '/j.png', '/Suasan.png', '/ano.png'],
    status: 'aktif',
    map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d507725.66124910297!2d106.22440498906248!3d-6.183356799999993!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f43118a6ee4d%3A0xb207584ff29d6769!2sBengkel%20Berkah%20Motor!5e0!3m2!1sen!2sid!4v1763209573087!5m2!1sen!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade',
    google_maps_url: 'https://www.google.com/maps/place/Bengkel+Berkah+Motor/@-6.1833134,106.834136,3a,116.4y,90t/data=!3m8!1e2!3m6!1sCIHM0ogKEICAgICul7ydWw!2e10!3e12!6shttps:%2F%2Flh3.googleusercontent.com%2Fgps-cs-s%2FAG0ilSx07ARu8WzypHy8_nNDu5_XROZakcmQ-6_NXZcXX7RQ7cdlLmpJjXC4G0s94QVMASjShVfEv6NZEU1BE6dz_lGQ-7kip7XtPZhyGzjyRJFtVtCQ8AVZiU6orvOlZi902n8dZoM%3Dw203-h114-k-no!7i2048!8i1152!4m11!1m2!2m1!1sbengkel+berkah+motor!3m7!1s0x2e69f43118a6ee4d:0xb207584ff29d6769!8m2!3d-6.1833568!4d106.8341462!10e5!15sChRiZW5na2VsIGJlcmthaCBtb3RvcloWIhRiZW5na2VsIGJlcmthaCBtb3RvcpIBFm1vdG9yY3ljbGVfcmVwYWlyX3Nob3CaASNDaFpEU1VoTk1HOW5TMFZKUTBGblNVTnRlWEJ4ZFVGM0VBRaoBVxABKhgiFGJlbmdrZWwgYmVya2FoIG1vdG9yKCYyHxABIhtFkO3YdtJqbdrw06G8bSZ63fSnWVbq0w_NHqgyGBACIhRiZW5na2VsIGJlcmthaCBtb3RvcuABAPoBBAgAEEA!16s%2Fg%2F11f5hlt6xp?entry=ttu&g_ep=EgoyMDI1MTExMi4wIKXMDSoASAFQAw%3D%3D',

  },
  // ID 6
  {
    id: 6,
    kapasitas: '10',
    nama_umkm: 'Toko Hana Craft',
    kategori: 'Menengah',
    jenis_usaha: 'Kerajinan Tangan',
    deskripsi: 'Menjual berbagai jenis kerajinan seni',
    provinsi: 'Jawa Barat',
    kota: 'Depok',
    alamat: 'Jl. Cahaya Garuda Permai Sawangan, Pasir Putih, Kec. Sawangan, Kota Depok, Jawa Barat 16519',
    jumlah_karyawan: '2',
    jam_operasional: '09:30 - 16:00',
    hari_operasional: 'Selasa - Minggu',
    foto_utama: '/char.png',
    galeri_foto: ['/Nama.jpg', '/tas.jpg', '/anyaman.png'],
    status: 'aktif',
    map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3964.9016819902586!2d106.77438649999999!3d-6.4066658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69e91eedebb5f7%3A0xa9612b2eb606391e!2sToko%20Hana%20Craft!5e0!3m2!1sen!2sid!4v1763210805911!5m2!1sen!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade',
    google_maps_url: 'https://www.google.com/maps/place/Toko+Hana+Craft/@-6.4066658,106.7743865,3a,94.8y,90t/data=!3m8!1e2!3m6!1sCIHM0ogKEICAgIDR68HBtgE!2e10!3e12!6shttps:%2F%2Flh3.googleusercontent.com%2Fgps-cs-s%2FAG0ilSyxwQMnZZSBTN9R0yhCbFTfK0zn1JasRKb7PmfLS8qmcYJnQTVMgjNpjcqwhrolxuleRxWulRramfsFy7khrHZYsSI9BzCS-Sx3N1UE-JnoyVuDXR65ZxzHwGIFpQkk5RBFdwfugw%3Dw86-h114-k-no!7i960!8i1280!4m7!3m6!1s0x2e69e91eedebb5f7:0xa9612b2eb606391e!8m2!3d-6.4067905!4d106.7743411!10e5!16s%2Fg%2F11j8qf2n6j?entry=ttu&g_ep=EgoyMDI1MTExMi4wIKXMDSoASAFQAw%3D%3D',
  },
  // ID 7
  {
    id: 7,
    kapasitas: '5',
    nama_umkm: 'Sulam Rajut Sopi (LC by Sopi)',
    kategori: 'Kecil',
    jenis_usaha: 'Kerajinan Tangan',
    deskripsi: 'Menjual berbagai jenis kerajinan tangan seperti anyaman, rajut, dan sulam',
    provinsi: 'Jawa Barat',
    kota: 'Depok',
    alamat: 'Sektor Melati, Blk. F4 Jl. Boulevard Grand Depok City No.8b, Jatimulya, Kec. Cilodong, Kota Depok, Jawa Barat 16413',
    jumlah_karyawan: '3',
    jam_operasional: '09:00 - 17:00',
    hari_operasional: 'Senin - Sabtu',
    foto_utama: '/i.png',
    galeri_foto: ['/ran.png', '/ruang.png', '/k.png'],
    status: 'Aktif',
    map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3964.611429187328!2d106.83213537472578!3d-6.443912393547413!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69eb351d09162b%3A0x301cf260ca969b8!2sSulam%20Rajut%20Sopi%20(LC%20by%20Sopi)!5e0!3m2!1sen!2sid!4v1763218302995!5m2!1sen!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade',
    google_maps_url: 'https://www.google.com/maps/place/Sulam+Rajut+Sopi+(LC+by+Sopi)/@-6.4439124,106.8321354,17z/data=!3m1!4b1!4m16!1m9!4m8!1m0!1m6!1m2!1s0x2e69eb351d09162b:0x301cf260ca969b8!2sSektor+Melati,+Blk.+F4+Jl.+Boulevard+Grand+Depok+City+No.8b,+Jatimulya,+Kec.+Cilodong,+Kota+Depok,+Jawa+Barat+16413!2m2!1d106.8347103!2d-6.4439124!3m5!1s0x2e69eb351d09162b:0x301cf260ca969b8!8m2!3d-6.4439124!4d106.8347103!16s%2Fg%2F11mw0gt2ys?entry=ttu&g_ep=EgoyMDI1MTExMi4wIKXMDSoASAFQAw%3D%3D',
  },
  // ID 8
  {
    id: 8,
    kapasitas: 'Relative',
    nama_umkm: 'Bebek Bumbu Hitam Khas Madura Cak Sakera',
    kategori: 'Mikro',
    jenis_usaha: 'Kuliner',
    deskripsi: 'Menjual berbagai olahan bebek khas Madura yang siap dimakan',
    provinsi: 'Jawa Barat',
    kota: 'Depok',
    alamat: 'Jl. K.H.M. Usman No.37, Kukusan, Kecamatan Beji, Kota Depok, Jawa Barat 16425',
    jumlah_karyawan: '2',
    jam_operasional: '05:00 - 17:00',
    hari_operasional: 'Senin - Minggu',
    foto_utama: '/u.jpeg',
    galeri_foto: ['/makan.jpeg', '/Dalamnya.jpeg', '/ibu.jpeg'],
    status: 'Aktif',
    map_url: 'https://www.google.com/maps/embed?pb=!4v1763219827903!6m8!1m7!1saNGVLBftKorpJuWWJq5BJQ!2m2!1d-6.362484603892502!2d106.816070200943!3f27.979840301043346!4f-9.377513995840758!5f0.7820865974627469" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade',
    google_maps_url: 'https://www.google.com/maps/place/Penyet+Cianjur/@-6.3624846,106.8160702,3a,75y,27.98h,80.62t/data=!3m7!1e1!3m5!1saNGVLBftKorpJuWWJq5BJQ!2e0!6shttps:%2F%2Fstreetviewpixels-pa.googleapis.com%2Fv1%2Fthumbnail%3Fcb_client%3Dmaps_sv.tactile%26w%3D900%26h%3D600%26pitch%3D9.377513995840758%26panoid%3DaNGVLBftKorpJuWWJq5BJQ%26yaw%3D27.979840301043346!7i16384!8i8192!4m15!1m8!3m7!1s0x2e69ee9fb2d69445:0x4ceac4e94a6e1471!2sNo.12B,+Jl.+Kukusan+Raya+No.12,+Kukusan,+Kecamatan+Beji,+Kota+Depok,+Jawa+Barat+16425!3b1!8m2!3d-6.3582797!4d106.8157678!16s%2Fg%2F11nngd3ltl!3m5!1s0x2e69ef4dbe266205:0xab502d2953d3ff78!8m2!3d-6.360355!4d106.8167749!16s%2Fg%2F11gvsl1v2v?hl=id&entry=ttu&g_ep=EgoyMDI1MTExMi4wIKXMDSoASAFQAw%3D%3D',
  },
  // ID 9
  {
    id: 9,
    kapasitas: '25',
    nama_umkm: 'Haidee & Orlin',
    kategori: 'Menengah',
    jenis_usaha: 'Fashion',
    deskripsi: 'Haidee & Orlin merupakan butik fashion lokal yang menyediakan berbagai pilihan pakaian wanita dengan desain trendi dan harga terjangkau.',
    provinsi: 'Jawa Barat',
    kota: 'Depok',
    alamat: 'Jl. Margonda No.505b, Pondok Cina, Kecamatan Beji, Kota Depok, Jawa Barat 16424',
    jumlah_karyawan: '5',
    jam_operasional: '09:00 - 20:00',
    hari_operasional: 'Senin - Minggu',
    foto_utama: '/l.png',
    galeri_foto: ['/nige.png', '/luar.png', '/rangkaian.png'],
    status: 'Aktif',
    map_url : 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.2466853820993!2d106.8334807667162!3d-6.362110915750566!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69ed2c6769ac2d%3A0xbc9cce1884ba8476!2sHaidee%20%26%20Orlin!5e0!3m2!1sen!2sid!4v1763221070030!5m2!1sen!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade',
    google_maps_url: 'https://www.google.com/maps/place/Haidee+%26+Orlin/@-6.3621109,106.8334808,17z/data=!4m14!1m7!3m6!1s0x2e69ed2c6769ac2d:0xbc9cce1884ba8476!2sHaidee+%26+Orlin!8m2!3d-6.3621223!4d106.8332942!16s%2Fg%2F11q377gtfl!3m5!1s0x2e69ed2c6769ac2d:0xbc9cce1884ba8476!8m2!3d-6.3621223!4d106.8332942!16s%2Fg%2F11q377gtfl?entry=ttu&g_ep=EgoyMDI1MTExMi4wIKXMDSoASAFQAw%3D%3D',
  },
  // ID 10
  {
    id: 10,
    kapasitas: '90',
    nama_umkm: 'GFSHOP',
    kategori: 'Menengah',
    jenis_usaha: 'Fashion',
    deskripsi: 'Toko ini menyediakan berbagai jenis pakaian untuk kebutuhan harian hingga acara tertentu, dengan pilihan model yang mengikuti tren terbaru.',
    provinsi: 'Jawa Barat',
    kota: 'Depok',
    alamat: 'Jl. Margonda No.397A, Pondok Cina, Kecamatan Beji, Kota Depok, Jawa Barat 16424',
    jumlah_karyawan: '3',
    jam_operasional: '10:00 - 21:00',
    hari_operasional: 'Senin - Sabtu',
    foto_utama: '/o.png',
    galeri_foto: ['/baris.png', '/risa.png', '/q.png', '/malam.png'],
    status: 'Aktif',
    map_url: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.182976969646!2d106.83070037472505!3d-6.370361793619829!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69ed85550a9f75%3A0x51ce2601bd419db5!2sGFSHOP!5e0!3m2!1sen!2sid!4v1763221845852!5m2!1sen!2sid" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade',
    google_maps_url: 'https://www.google.com/maps/place/GFSHOP/@-6.3703618,106.8307004,17z/data=!3m1!4b1!4m6!3m5!1s0x2e69ed85550a9f75:0x51ce2601bd419db5!8m2!3d-6.3703618!4d106.8332753!16s%2Fg%2F11f6gj91dj?entry=ttu&g_ep=EgoyMDI1MTExMi4wIKXMDSoASAFQAw%3D%3D',
  }
]

const umkmList = ref([])

// Load data dari localStorage saat komponen di-mount
onMounted(() => {
  loadUmkmData()
})

const loadUmkmData = () => {
  const storedData = localStorage.getItem('umkmList')
  if (storedData) {
    umkmList.value = JSON.parse(storedData)
  } else {
    // Jika belum ada data, gunakan data default
    umkmList.value = [...defaultUmkmList]
    localStorage.setItem('umkmList', JSON.stringify(defaultUmkmList))
  }
}

const deleteUmkm = (id) => {
  if (confirm('Apakah Anda yakin ingin menghapus UMKM ini?')) {
    // Filter out the UMKM with matching id
    umkmList.value = umkmList.value.filter(umkm => umkm.id !== id)
    
    // Update localStorage
    localStorage.setItem('umkmList', JSON.stringify(umkmList.value))
    
    // Show success message (optional)
    alert('UMKM berhasil dihapus!')
  }
}

const resetAllData = () => {
  if (confirm('⚠️ PERINGATAN: Ini akan menghapus SEMUA data UMKM yang baru ditambahkan dan mengembalikan ke data default. Lanjutkan?')) {
    // Reset to default data
    umkmList.value = [...defaultUmkmList]
    localStorage.setItem('umkmList', JSON.stringify(defaultUmkmList))
    
    // Reset search and filter
    searchQuery.value = ''
    activeCategory.value = categories[0]
    
    alert('✅ Data berhasil direset ke default!')
  }
}

const setActive = (category) => {
  activeCategory.value = category
}

const nextCategory = () => {
  const currentIndex = categories.findIndex(cat => cat.label === activeCategory.value.label)
  const nextIndex = (currentIndex + 1) % categories.length
  activeCategory.value = categories[nextIndex]
}

const detectCategoryFromSearch = () => {
  if (!searchQuery.value.trim()) {
    activeCategory.value = categories[0]
    return
  }

  const query = searchQuery.value.toLowerCase().trim()
  
  const matchedUMKM = umkmList.value.filter(umkm => {
    const nama = (umkm.nama_umkm || '').toLowerCase()
    const deskripsi = (umkm.deskripsi || '').toLowerCase()
    const alamat = (umkm.alamat || '').toLowerCase()
    const kota = (umkm.kota || '').toLowerCase()
    const provinsi = (umkm.provinsi || '').toLowerCase()
    const jenis = (umkm.jenis_usaha || '').toLowerCase()
    
    return nama.includes(query) ||
           deskripsi.includes(query) ||
           alamat.includes(query) ||
           kota.includes(query) ||
           provinsi.includes(query) ||
           jenis.includes(query)
  })

  if (matchedUMKM.length === 0) {
    activeCategory.value = categories[0]
    return
  }

  const categoryCount = {}
  matchedUMKM.forEach(umkm => {
    const jenis = umkm.jenis_usaha || ''
    categoryCount[jenis] = (categoryCount[jenis] || 0) + 1
  })

  let maxCount = 0
  let dominantCategory = ''
  
  Object.entries(categoryCount).forEach(([jenis, count]) => {
    if (count > maxCount) {
      maxCount = count
      dominantCategory = jenis
    }
  })

  const foundCategory = categories.find(cat => {
    if (cat.value === 'Semua') return false
    return cat.value.toLowerCase() === dominantCategory.toLowerCase() ||
           dominantCategory.toLowerCase().includes(cat.value.toLowerCase()) ||
           cat.value.toLowerCase().includes(dominantCategory.toLowerCase())
  })
  
  if (foundCategory) {
    activeCategory.value = foundCategory
  } else {
    activeCategory.value = categories[0]
  }
}

const handleSearch = () => {
  if (searchQuery.value.trim()) {
    detectCategoryFromSearch()
  }
}

const filteredUMKM = computed(() => {
  let filtered = umkmList.value

  if (searchQuery.value.trim()) {
    const query = searchQuery.value.toLowerCase().trim()
    filtered = filtered.filter(umkm => {
      const nama = (umkm.nama_umkm || '').toLowerCase()
      const deskripsi = (umkm.deskripsi || '').toLowerCase()
      const alamat = (umkm.alamat || '').toLowerCase()
      const kota = (umkm.kota || '').toLowerCase()
      const provinsi = (umkm.provinsi || '').toLowerCase()
      const jenis = (umkm.jenis_usaha || '').toLowerCase()
      
      return nama.includes(query) ||
             deskripsi.includes(query) ||
             alamat.includes(query) ||
             kota.includes(query) ||
             provinsi.includes(query) ||
             jenis.includes(query)
    })
  }

  if (activeCategory.value.value !== 'Semua') {
    filtered = filtered.filter(umkm => 
      (umkm.jenis_usaha || '').toLowerCase() === activeCategory.value.value.toLowerCase()
    )
  }

  return filtered
})
</script>

<template>
  <div>
    <!-- Hero Section -->
    <div class="relative flex flex-col items-center px-4 sm:px-6 lg:px-8 pt-12 sm:pt-16 md:pt-20 pb-16 sm:pb-20 md:pb-24">
      
      <div class="decorative-shape shape-1"></div>
      <div class="decorative-shape shape-2"></div>
      <div class="decorative-shape shape-3"></div>

      <div class="relative z-10 w-full max-w-7xl mx-auto flex flex-col items-center space-y-5 sm:space-y-6 md:space-y-8 lg:space-y-10">
        
        <div
          class="logo-badge flex items-center gap-2 sm:gap-3 bg-white/95 backdrop-blur-md text-[#F15A24]
          px-5 py-2 sm:px-7 sm:py-2.5 md:px-9 md:py-3 rounded-2xl shadow-[0_8px_30px_rgba(251,109,0,0.15)]
          hover:shadow-[0_12px_40px_rgba(251,109,0,0.25)] border-2 border-[#FB6D00]/20
          transition-all duration-500 ease-out hover:scale-105 group"
        >
          <div class="relative">
            <div class="absolute inset-0 bg-[#FB6D00] rounded-full blur-md opacity-30 group-hover:opacity-50 transition-opacity"></div>
            <img
              :src="bxLogo"
              alt="logo"
              class="relative w-5 h-5 sm:w-6 sm:h-6 md:w-8 md:h-8 drop-shadow-lg transition-transform duration-500 group-hover:rotate-12 group-hover:scale-110"
            />
          </div>
          <span
            class="font-poppins font-bold text-base sm:text-lg md:text-xl lg:text-2xl tracking-wide select-none bg-gradient-to-r from-[#F15A24] to-[#FB6D00] bg-clip-text text-transparent"
          >
            UMKM Kami
          </span>
          <div class="w-2 h-2 bg-[#FB6D00] rounded-full animate-pulse"></div>
        </div>

        <div class="text-center space-y-2 sm:space-y-4 md:space-y-5 px-4 py-2">
          <div class="inline-block">
            <h1 class="hero-title text-3xl sm:text-5xl md:text-6xl lg:text-7xl xl:text-8xl font-black leading-tight sm:leading-snug">
              <span class="inline-block text-gray-900 drop-shadow-sm mr-0.5 sm:mr-2 md:mr-3">UMKM</span>
              <span class="inline-block bg-gradient-to-r from-[#FB6D00] via-[#FF8534] to-[#F15A24] bg-clip-text text-transparent drop-shadow-lg animate-gradient mx-0.5 sm:mx-2 md:mx-3">
                Unggulan
              </span>
              <span class="inline-block text-gray-900 drop-shadow-sm ml-0.5 sm:ml-2 md:ml-3">Kami</span>
            </h1>
            <div class="h-0.5 sm:h-1 md:h-1.5 w-24 sm:w-48 md:w-64 mx-auto mt-2 sm:mt-3 md:mt-4 bg-gradient-to-r from-transparent via-[#FB6D00] to-transparent rounded-full"></div>
          </div>

          <p class="hero-subtitle text-xs sm:text-base md:text-lg lg:text-xl text-gray-600 font-montserrat leading-relaxed max-w-xs sm:max-w-md md:max-w-2xl lg:max-w-3xl mx-auto px-2 sm:px-4 py-1 mt-3 sm:mt-4">
            Pilihan terbaik dari <span class="font-semibold text-[#FB6D00]">ribuan UMKM Indonesia</span>
            <br class="hidden sm:block" />
            <span class="hidden sm:inline">dengan kualitas terjamin dan harga terjangkau</span>
            <span class="sm:hidden">dengan kualitas terjamin dan terjangkau</span>
          </p>

          <div class="flex flex-wrap items-center justify-center gap-1.5 sm:gap-3 mt-2 sm:mt-5 px-2">
            <span class="px-2 sm:px-4 py-1 sm:py-2 bg-white/80 backdrop-blur-sm rounded-full text-[10px] sm:text-sm font-medium text-gray-700 shadow-md border border-gray-200">
              ✓ Berkualitas
            </span>
            <span class="px-2 sm:px-4 py-1 sm:py-2 bg-white/80 backdrop-blur-sm rounded-full text-[10px] sm:text-sm font-medium text-gray-700 shadow-md border border-gray-200">
              ✓ Terpercaya
            </span>
            <span class="px-2 sm:px-4 py-1 sm:py-2 bg-white/80 backdrop-blur-sm rounded-full text-[10px] sm:text-sm font-medium text-gray-700 shadow-md border border-gray-200">
              ✓ Terjangkau
            </span>
          </div>
        </div>

        <!-- Search Container -->
        <div class="search-container w-full max-w-xs sm:max-w-md md:max-w-2xl lg:max-w-3xl px-3 sm:px-4">
          <div
            class="relative flex items-center bg-white rounded-xl sm:rounded-3xl shadow-[0_10px_40px_rgba(0,0,0,0.1)] 
            hover:shadow-[0_15px_50px_rgba(251,109,0,0.2)] transition-all duration-300 
            border-2 border-gray-100 hover:border-[#FB6D00]/30 group overflow-hidden"
          >
            <div class="flex items-center justify-center pl-3 sm:pl-5 md:pl-7 pr-1 sm:pr-3">
              <div class="relative">
                <div class="absolute inset-0 bg-[#FB6D00] rounded-full blur-md opacity-0 group-hover:opacity-30 transition-opacity"></div>
                <svg
                  class="relative w-4 h-4 sm:w-6 sm:h-6 md:w-7 md:h-7 text-[#FB6D00] transition-transform duration-300 group-hover:scale-110 group-hover:rotate-12"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2.5"
                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                  />
                </svg>
              </div>
            </div>
            
            <input
              v-model="searchQuery"
              @keyup.enter="handleSearch"
              type="text"
              placeholder="Cari UMKM anda............"
              class="flex-1 py-2.5 sm:py-4 md:py-5 px-1 sm:px-3 text-xs sm:text-base md:text-lg text-gray-700 placeholder-gray-400 
              bg-transparent outline-none font-montserrat min-w-0"
            />
            
            <button
              @click="handleSearch"
              class="m-1 sm:m-2 px-4 sm:px-6 md:px-8 py-1.5 sm:py-2.5 md:py-3 bg-gradient-to-r from-[#FB6D00] to-[#F15A24] text-white 
              rounded-lg sm:rounded-2xl font-poppins font-bold text-[10px] sm:text-sm md:text-base
              hover:from-[#F15A24] hover:to-[#E54D00] transition-all duration-300 
              shadow-lg hover:shadow-xl hover:scale-105 active:scale-95 whitespace-nowrap
              relative overflow-hidden group/btn"
            >
              <span class="relative z-10">Cari</span>
              <div class="absolute inset-0 bg-white/20 translate-y-full group-hover/btn:translate-y-0 transition-transform duration-300"></div>
            </button>
          </div>

          <p class="text-center text-[10px] sm:text-sm text-gray-500 mt-2 sm:mt-4 font-montserrat">
            Temukan UMKM terbaik di Indonesia 🇮🇩
            <span v-if="searchQuery.trim()" class="block mt-1 text-[#FB6D00] font-medium">
              🎯 Kategori akan otomatis disesuaikan dengan hasil pencarian
            </span>
          </p>
        </div>

        <!-- Filter Categories -->
        <div class="filter-section w-full max-w-7xl px-3 sm:px-4 mt-3 sm:mt-5 md:mt-6 mb-4 sm:mb-8">
          <div class="flex flex-wrap items-center justify-center gap-2 sm:gap-3 md:gap-4">
            <button
              v-for="category in categories"
              :key="category.label"
              @click="setActive(category)"
              :class="[
                'category-btn font-poppins font-medium text-[10px] sm:text-sm md:text-base lg:text-lg',
                'px-3 py-1.5 sm:px-6 sm:py-2 md:px-10 md:py-3 lg:px-12 lg:py-3.5',
                'rounded-lg sm:rounded-xl whitespace-nowrap',
                'transition-all duration-300 shadow-md',
                activeCategory.label === category.label
                  ? 'bg-gradient-to-r from-[#FF6B00] via-[#FB4D03] to-[#FB4D03] text-white shadow-[0_4px_12px_rgba(255,107,0,0.3)] scale-105'
                  : 'bg-white text-gray-700 hover:bg-gradient-to-r hover:from-[#FF6B00] hover:via-[#FB4D03] hover:to-[#FB4D03] hover:text-white hover:shadow-[0_4px_12px_rgba(255,107,0,0.3)] hover:-translate-y-0.5'
              ]"
            >
              {{ category.label }}
            </button>
            
            <button
              @click="nextCategory"
              class="w-8 h-8 sm:w-12 sm:h-12 md:w-14 md:h-14 lg:w-16 lg:h-16 rounded-full bg-gradient-to-r from-[#FF6B00] to-[#FB4D03] 
              flex items-center justify-center shadow-[0_4px_12px_rgba(255,107,0,0.3)]
              hover:scale-110 hover:shadow-[0_6px_16px_rgba(255,107,0,0.4)] transition-all duration-300
              active:scale-95 flex-shrink-0"
            >
              <svg class="w-4 h-4 sm:w-6 sm:h-6 md:w-7 md:h-7 lg:w-8 lg:h-8 text-white" viewBox="0 0 24 24" fill="currentColor">
                <path d="M8.59 16.59L13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/>
              </svg>
            </button>
          </div>
          
         
        </div>

      </div>
    </div>

    <div class="container mx-auto px-4 py-3 max-w-7xl">

      <!-- Cards Grid UMKM -->
      <div v-if="filteredUMKM.length > 0" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8">
        <div 
          v-for="umkm in filteredUMKM" 
          :key="umkm.id" 
          class="bg-white rounded-lg shadow-md hover:shadow-xl transform hover:scale-105 transition duration-300 ease-in-out cursor-pointer flex flex-col overflow-hidden"
        >
          <!-- Image -->
          <div class="relative h-48 sm:h-56 overflow-hidden">
            <img 
              :src="umkm.foto_utama || 'https://via.placeholder.com/400x300?text=No+Image'" 
              :alt="umkm.nama_umkm"
              class="w-full h-full object-cover transition-transform duration-300 hover:scale-110"
            />
            <span class="absolute top-3 left-3 bg-[#ff6b35] text-white text-xs font-semibold rounded-full px-3 py-1 font-poppins">
              {{ umkm.jenis_usaha }}
            </span>
          </div>

          <!-- Card Content -->
          <div class="flex flex-col flex-grow p-4">
            <h3 class="text-lg font-semibold text-gray-900 mb-2 line-clamp-2 font-poppins">
              {{ umkm.nama_umkm }}
            </h3>
            <p class="text-gray-600 text-sm line-clamp-3 mb-4 font-montserrat">
              {{ umkm.deskripsi }}
            </p>

            <div class="space-y-2 text-gray-700 text-sm flex-grow font-montserrat">
              <div class="flex items-start gap-3">
                <svg class="w-8 h-8 flex-shrink-0 mt-1" viewBox="0 0 24 24" fill="#f97316">
                  <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                </svg>
                <span class="pt-1">
                  {{ umkm.alamat }}, {{ umkm.kota }}, {{ umkm.provinsi }}
                </span>
              </div>
              <div class="flex items-center gap-3">
                <svg class="w-8 h-8 flex-shrink-0" viewBox="0 0 24 24" fill="#f97316">
                  <path d="M12 2C6.5 2 2 6.5 2 12s4.5 10 10 10 10-4.5 10-10S17.5 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67z"/>
                </svg>
                <span class="pt-1">{{ umkm.jam_operasional }}</span>
              </div>
              <div class="flex items-center gap-3">
                <svg class="w-8 h-8 flex-shrink-0" viewBox="0 0 24 24" fill="#f97316">
                  <path d="M19 4h-1V2h-2v2H8V2H6v2H5c-1.11 0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V10h14v10zm0-12H5V6h14v2zm-7 5h5v5h-5z"/>
                </svg>
                <span class="pt-1">{{ umkm.hari_operasional }}</span>
              </div>
            </div>

            <!-- Action Buttons -->
            <div class="flex gap-2 mt-6">
              <button
                @click="goDetail(umkm.id)"
                class="flex-1 bg-[#ff6b35] hover:bg-[#ff5722] text-white py-2 rounded-lg font-semibold transition-colors font-poppins"
              >
                Lihat Detail
              </button>
              
              <!-- Delete Button - Only show for newly added UMKM (ID > 10) -->
              <button
                v-if="umkm.id > 10"
                @click.stop="deleteUmkm(umkm.id)"
                class="px-4 py-2 bg-red-500 hover:bg-red-600 text-white rounded-lg font-semibold transition-colors flex items-center justify-center"
                title="Hapus UMKM"
              >
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                </svg>
              </button>
            </div>

          </div>
        </div>
      </div>

      <!-- No Results -->
      <div v-else class="text-center py-20">
        <svg class="w-24 h-24 mx-auto text-gray-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
        <p class="text-gray-500 text-lg font-montserrat">
          {{ searchQuery ? 'Tidak ada UMKM yang sesuai dengan pencarian "' + searchQuery + '"' : 'Tidak ada data UMKM yang sesuai' }}
        </p>
        <button 
          v-if="searchQuery"
          @click="searchQuery = ''"
          class="mt-4 text-[#FB6D00] hover:text-[#F15A24] font-poppins font-medium"
        >
          Hapus Pencarian
        </button>
      </div>
    </div>
  </div>
  
</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700;800;900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600&display=swap');

.font-montserrat {
  font-family: 'Montserrat', sans-serif;
}

.font-poppins {
  font-family: 'Poppins', sans-serif;
}

.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;  
  overflow: hidden;
}

.line-clamp-3 {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;  
  overflow: hidden;
}

@keyframes gradient {
  0%, 100% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
}

.animate-gradient {
  background-size: 200% 200%;
  animation: gradient 3s ease infinite;
}
</style>