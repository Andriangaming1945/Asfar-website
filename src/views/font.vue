<template>
  <div class="min-h-screen py-8 px-4">
   
    <div v-if="submitted" class="min-h-screen flex items-center justify-center p-4">
      <div class="bg-white rounded-2xl shadow-2xl p-8 max-w-md w-full text-center animate-fade-in">
        <div class="mb-6">
          <svg class="w-20 h-20 text-green-500 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        </div>
        <h2 class="text-3xl font-bold text-gray-800 mb-4">
          Pendaftaran Berhasil!
        </h2>
        <p class="text-gray-600 mb-6">
          Terima kasih! UMKM <span class="font-semibold text-orange-600">{{ formData.nama_umkm }}</span> Anda telah terdaftar.
        </p>
        
        <!-- Response Data -->
        <div v-if="newUmkmData" class="bg-green-50 border border-green-200 rounded-lg p-4 mb-6 text-left">
          <p class="text-sm text-gray-700"><strong>ID UMKM:</strong> {{ newUmkmData.id }}</p>
          <p class="text-sm text-gray-700"><strong>Kategori:</strong> {{ newUmkmData.kategori }}</p>
          <p class="text-sm text-gray-700"><strong>Jenis Usaha:</strong> {{ newUmkmData.jenis_usaha }}</p>
          <p class="text-sm text-gray-700"><strong>Kota:</strong> {{ newUmkmData.kota }}</p>
        </div>
        
        <p class="text-sm text-gray-500 mb-8">
          🎉 Data telah tersimpan di sistem lokal. Anda bisa melihatnya di halaman UMKM Kami!
        </p>
        <div class="flex gap-3">
          <button
            @click="goToUmkmList"
            class="flex-1 bg-orange-500 text-white px-6 py-3 rounded-lg font-semibold hover:bg-orange-600 transition-all transform hover:scale-105"
          >
            Lihat Daftar UMKM
          </button>
          <button
            @click="resetForm"
            class="flex-1 bg-gray-500 text-white px-6 py-3 rounded-lg font-semibold hover:bg-gray-600 transition-all transform hover:scale-105"
          >
            Daftar Lagi
          </button>
        </div>
      </div>
    </div>

    <!-- Registration Form -->
    <div v-else class="max-w-4xl mx-auto">
      <!-- Header -->
      <div class="bg-gradient-to-r from-orange-500 to-orange-600 rounded-2xl shadow-xl p-8 mb-8 text-white">
        <div class="flex items-center justify-center mb-4">
          <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
          </svg>
        </div>
        <h1 class="text-3xl md:text-4xl font-bold text-center mb-3">
          Daftar UMKM Anda
        </h1>
        <p class="text-center text-orange-100 text-lg">
          Bergabunglah dengan ribuan UMKM di seluruh Indonesia dan raih peluang besar!
        </p>
      
      </div>

      <!-- Progress Steps -->
      <div class="flex justify-center items-center mb-8 px-4 gap-4">
        <div v-for="s in 2" :key="s" class="flex items-center">
          <div :class="[
            'flex items-center justify-center w-12 h-12 rounded-full font-bold transition-all border-4',
            step >= s ? 'border-orange-500 text-orange-500 scale-110' : 'border-gray-300 text-gray-400'
          ]">
            {{ s }}
          </div>
          <div v-if="s < 2" :class="[
            'w-16 h-1 mx-2 transition-all',
            step > s ? 'bg-orange-500' : 'bg-gray-300'
          ]" />
        </div>
      </div>

      <!-- Error Message -->
      <div v-if="error" class="bg-red-50 border-l-4 border-red-500 p-4 mb-6 rounded">
        <p class="text-red-700">{{ error }}</p>
      </div>

      <!-- Loading Overlay -->
      <div v-if="loading" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
        <div class="bg-white rounded-lg p-8 text-center">
          <div class="spinner mb-4"></div>
          <p class="text-gray-700 font-semibold">Sedang memproses data...</p>
        </div>
      </div>
    
      <div class="bg-white rounded-2xl shadow-xl p-8">
        
        <!-- Step 1: Informasi UMKM -->
        <div v-if="step === 1" class="space-y-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-6 flex items-center">
            <svg class="mr-3 text-orange-500 w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
            </svg>
            Informasi UMKM
          </h2>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Nama UMKM *
            </label>
            <input
              v-model="formData.nama_umkm"
              type="text"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
              placeholder="Nama usaha Anda"
            />
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Kategori UMKM *
            </label>
            <select
              v-model="formData.kategori"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
            >
              <option value="">Pilih kategori</option>
              <option v-for="kat in kategoriList" :key="kat" :value="kat">
                {{ kat }}
              </option>
            </select>
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Jenis Usaha *
            </label>
            <select
              v-model="formData.jenis_usaha"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
            >
              <option value="">Pilih jenis usaha</option>
              <option v-for="jenis in jenisUsahaList" :key="jenis" :value="jenis">
                {{ jenis }}
              </option>
            </select>
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Deskripsi Usaha *
            </label>
            <textarea
              v-model="formData.deskripsi"
              rows="4"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
              placeholder="Ceritakan tentang produk atau layanan UMKM Anda"
            />
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Jumlah Karyawan
            </label>
            <input
              v-model="formData.jumlah_karyawan"
              type="number"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
              placeholder="0"
            />
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Jam Operasional
            </label>
            <input
              v-model="formData.jam_operasional"
              type="text"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
              placeholder="08:00 - 17:00"
            />
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Hari Operasional
            </label>
            <input
              v-model="formData.hari_operasional"
              type="text"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
              placeholder="Senin - Jumat / Senin - Minggu"
            />
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Foto Utama UMKM
            </label>
            <input
              @change="handleFileChange"
              ref="fotoUtama"
              type="file"
              accept="image/*"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
            />
            <p class="text-xs text-gray-500 mt-1">Format: JPG, PNG, GIF (Max: 2MB)</p>
            
            <!-- Preview Foto Utama -->
            <div v-if="fotoUtamaPreview" class="mt-4">
              <img :src="fotoUtamaPreview" class="w-full max-w-md h-48 object-cover rounded-lg border-2 border-gray-300" />
            </div>
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Galeri Foto (Opsional)
            </label>
            <input
              @change="handleGaleriChange"
              ref="galeriFoto"
              type="file"
              accept="image/*"
              multiple
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
            />
            <p class="text-xs text-gray-500 mt-1">Bisa upload lebih dari 1 foto sekaligus</p>
            
            <!-- Preview Galeri Foto -->
            <div v-if="galeriPreviews.length > 0" class="mt-4 grid grid-cols-2 md:grid-cols-4 gap-4">
              <div v-for="(preview, index) in galeriPreviews" :key="index" class="relative group">
                <img :src="preview" class="w-full h-32 object-cover rounded-lg border-2 border-gray-300" />
                <button
                  @click="removeGaleriFoto(index)"
                  type="button"
                  class="absolute top-1 right-1 bg-red-500 text-white rounded-full w-6 h-6 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity"
                >
                  ×
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Step 2: Lokasi -->
        <div v-if="step === 2" class="space-y-6">
          <h2 class="text-2xl font-bold text-gray-800 mb-6 flex items-center">
            <svg class="mr-3 text-orange-500 w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
            </svg>
            Lokasi Usaha
          </h2>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Provinsi *
            </label>
            <select
              v-model="formData.provinsi"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
            >
              <option value="">Pilih provinsi</option>
              <option v-for="prov in provinsiList" :key="prov" :value="prov">
                {{ prov }}
              </option>
            </select>
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Kota/Kabupaten *
            </label>
            <input
              v-model="formData.kota"
              type="text"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
              placeholder="Masukkan nama kota/kabupaten"
            />
          </div>

          <div>
            <label class="block text-sm font-semibold text-gray-700 mb-2">
              Alamat Lengkap *
            </label>
            <textarea
              v-model="formData.alamat"
              rows="3"
              class="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-orange-500 focus:outline-none transition-colors"
              placeholder="Jalan, nomor, RT/RW, kelurahan, kecamatan, kode pos"
            />
          </div>

          <div class="bg-orange-50 border-l-4 border-orange-500 p-4 rounded">
            <p class="text-sm text-gray-700">
              <span class="font-semibold">💡 Mode Simulasi:</span> Data yang Anda input akan tersimpan secara lokal dan dapat dilihat di halaman "UMKM Kami". Data ini hanya tersimpan selama sesi browser aktif.
            </p>
          </div>
        </div>

        <!-- Navigation Buttons -->
        <div class="flex justify-between mt-8">
          <button
            v-if="step > 1"
            @click="prevStep"
            class="px-6 py-3 bg-gray-200 text-gray-700 rounded-lg font-semibold hover:bg-gray-300 transition-all"
          >
            Kembali
          </button>
          
          <button
            v-if="step < 2"
            @click="nextStep"
            class="ml-auto px-6 py-3 bg-orange-500 text-white rounded-lg font-semibold hover:bg-orange-600 transition-all transform hover:scale-105"
          >
            Selanjutnya
          </button>
          
          <button
            v-else
            @click="handleSubmit"
            :disabled="loading"
            class="ml-auto px-8 py-3 bg-green-500 text-white rounded-lg font-semibold hover:bg-green-600 transition-all transform hover:scale-105 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {{ loading ? 'Memproses...' : '✨ Daftar Sekarang' }}
          </button>
        </div>
      </div>

      <!-- Footer Info -->
      <div class="mt-8 text-center text-gray-600">
        <p class="text-sm">
          🎯 Ini adalah mode simulasi. Data akan tersimpan secara lokal di browser Anda.
        </p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();

const step = ref(1);
const submitted = ref(false);
const loading = ref(false);
const error = ref('');
const newUmkmData = ref(null);
const fotoUtamaPreview = ref(null);
const galeriPreviews = ref([]);

const formData = ref({
  nama_umkm: '',
  kategori: '',
  jenis_usaha: '',
  deskripsi: '',
  provinsi: '',
  kota: '',
  alamat: '',
  jumlah_karyawan: '',
  jam_operasional: '',
  hari_operasional: '',
  foto_utama: null,
  foto_utama_url: '',
  galeri_foto: [],
  galeri_foto_urls: []
});

const provinsiList = [
  'Aceh', 'Sumatera Utara', 'Sumatera Barat', 'Riau', 'Kepulauan Riau',
  'Jambi', 'Sumatera Selatan', 'Bangka Belitung', 'Bengkulu', 'Lampung',
  'DKI Jakarta', 'Jawa Barat', 'Jawa Tengah', 'DI Yogyakarta', 'Jawa Timur',
  'Banten', 'Bali', 'Nusa Tenggara Barat', 'Nusa Tenggara Timur',
  'Kalimantan Barat', 'Kalimantan Tengah', 'Kalimantan Selatan',
  'Kalimantan Timur', 'Kalimantan Utara', 'Sulawesi Utara', 'Gorontalo',
  'Sulawesi Tengah', 'Sulawesi Barat', 'Sulawesi Selatan',
  'Sulawesi Tenggara', 'Maluku', 'Maluku Utara', 'Papua', 'Papua Barat',
  'Papua Barat Daya', 'Papua Pegunungan', 'Papua Tengah', 'Papua Selatan'
];

const jenisUsahaList = ['Kuliner', 'Fashion', 'Kerajinan Tangan', 'Jasa'];
const kategoriList = ['Mikro', 'Kecil', 'Menengah', 'Lainnya'];

const fotoUtama = ref(null);
const galeriFoto = ref(null);

const handleFileChange = (event) => {
  const file = event.target.files[0];
  if (file) {
    formData.value.foto_utama = file;
    const reader = new FileReader();
    reader.onload = (e) => {
      fotoUtamaPreview.value = e.target.result;
      formData.value.foto_utama_url = e.target.result;
    };
    reader.readAsDataURL(file);
  }
};

const handleGaleriChange = (event) => {
  const files = Array.from(event.target.files);
  
  files.forEach(file => {
    formData.value.galeri_foto.push(file);
    
    const reader = new FileReader();
    reader.onload = (e) => {
      galeriPreviews.value.push(e.target.result);
      formData.value.galeri_foto_urls.push(e.target.result);
    };
    reader.readAsDataURL(file);
  });
  
  if (galeriFoto.value) {
    galeriFoto.value.value = '';
  }
};

const removeGaleriFoto = (index) => {
  formData.value.galeri_foto.splice(index, 1);
  galeriPreviews.value.splice(index, 1);
  formData.value.galeri_foto_urls.splice(index, 1);
};

const validateCurrentStep = () => {
  if (step.value === 1) {
    return formData.value.nama_umkm && formData.value.kategori && formData.value.jenis_usaha && formData.value.deskripsi;
  } else if (step.value === 2) {
    return formData.value.provinsi && formData.value.kota && formData.value.alamat;
  }
  return true;
};

const nextStep = () => {
  if (validateCurrentStep() && step.value < 2) {
    step.value++;
    error.value = '';
  } else {
    error.value = 'Mohon lengkapi semua field yang wajib diisi (*)';
  }
};

const prevStep = () => {
  if (step.value > 1) {
    step.value--;
    error.value = '';
  }
};

const handleSubmit = () => {
  if (!validateCurrentStep()) {
    error.value = 'Mohon lengkapi semua field yang wajib diisi (*)';
    return;
  }

  loading.value = true;
  error.value = '';

  // Simulasi proses penyimpanan
  setTimeout(() => {
    try {
      // Ambil data UMKM yang sudah ada dari localStorage
      const existingData = localStorage.getItem('umkmList');
      const umkmList = existingData ? JSON.parse(existingData) : [];
      
      // Generate ID baru
      const newId = umkmList.length > 0 ? Math.max(...umkmList.map(u => u.id)) + 1 : 11;
      
      // Buat objek UMKM baru
      const newUmkm = {
        id: newId,
        kapasitas: 'Relative',
        nama_umkm: formData.value.nama_umkm,
        kategori: formData.value.kategori,
        jenis_usaha: formData.value.jenis_usaha,
        deskripsi: formData.value.deskripsi,
        provinsi: formData.value.provinsi,
        kota: formData.value.kota,
        alamat: formData.value.alamat,
        jumlah_karyawan: formData.value.jumlah_karyawan || '0',
        jam_operasional: formData.value.jam_operasional || '08:00 - 17:00',
        hari_operasional: formData.value.hari_operasional || 'Senin - Jumat',
        foto_utama: formData.value.foto_utama_url || 'https://via.placeholder.com/400x300?text=No+Image',
        galeri_foto: formData.value.galeri_foto_urls.length > 0 ? formData.value.galeri_foto_urls : [],
        status: 'Aktif',
        map_url: '',
        google_maps_url: ''
      };
      
      // Tambahkan ke array
      umkmList.push(newUmkm);
      
      // Simpan kembali ke localStorage
      localStorage.setItem('umkmList', JSON.stringify(umkmList));
      
      // Set data untuk ditampilkan
      newUmkmData.value = newUmkm;
      
      // Tampilkan sukses
      submitted.value = true;
      loading.value = false;
    } catch (err) {
      console.error('Submit error:', err);
      error.value = 'Terjadi kesalahan saat menyimpan data';
      loading.value = false;
    }
  }, 1500); // Simulasi delay 1.5 detik
};

const resetForm = () => {
  submitted.value = false;
  step.value = 1;
  error.value = '';
  newUmkmData.value = null;
  fotoUtamaPreview.value = null;
  galeriPreviews.value = [];
  formData.value = {
    nama_umkm: '',
    kategori: '',
    jenis_usaha: '',
    deskripsi: '',
    provinsi: '',
    kota: '',
    alamat: '',
    jumlah_karyawan: '',
    jam_operasional: '',
    hari_operasional: '',
    foto_utama: null,
    foto_utama_url: '',
    galeri_foto: [],
    galeri_foto_urls: []
  };
  
  if (fotoUtama.value) {
    fotoUtama.value.value = '';
  }
  if (galeriFoto.value) {
    galeriFoto.value.value = '';
  }
};

const goToUmkmList = () => {
  router.push('/umkm');
};
</script>

<style scoped>
.animate-fade-in {
  animation: fadeIn 0.5s ease-in;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.spinner {
  width: 50px;
  height: 50px;
  border: 4px solid #f3f3f3;
  border-top: 4px solid #ff6b35;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin: 0 auto;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>