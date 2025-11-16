<template>
  <div class="min-h-screen">
    <!-- Loading State -->
    <div v-if="loading" class="flex justify-center items-center min-h-screen">
      <div class="text-center">
        <div class="relative">
          <div class="w-24 h-24 border-8 border-orange-200 border-t-[#FB6D00] rounded-full animate-spin mx-auto"></div>
          <div class="absolute inset-0 flex items-center justify-center">
            <svg class="w-12 h-12" viewBox="0 0 24 24" fill="#f97316">
              <path d="M12 7V3H2v18h20V7H12zM6 19H4v-2h2v2zm0-4H4v-2h2v2zm0-4H4V9h2v2zm0-4H4V5h2v2zm4 12H8v-2h2v2zm0-4H8v-2h2v2zm0-4H8V9h2v2zm0-4H8V5h2v2zm10 12h-8v-2h2v-2h-2v-2h2v-2h-2V9h8v10zm-2-8h-2v2h2v-2zm0 4h-2v2h2v-2z"/>
            </svg>
          </div>
        </div>
        <p class="mt-6 text-gray-700 font-bold text-xl">Memuat Detail UMKM...</p>
      </div>
    </div>

    <!-- Error State -->
    <div v-else-if="error" class="container mx-auto px-4 py-12 max-w-2xl">
      <div class="bg-white border-l-8 border-red-500 rounded-2xl p-8 shadow-2xl">
        <div class="flex items-start gap-4">
          <div class="w-16 h-16 bg-red-500 rounded-2xl flex items-center justify-center flex-shrink-0 shadow-lg">
            <svg class="w-10 h-10" viewBox="0 0 24 24" fill="white">
              <path d="M1 21h22L12 2 1 21zm12-3h-2v-2h2v2zm0-4h-2v-4h2v4z"/>
            </svg>
          </div>
          <div class="flex-1">
            <h3 class="text-red-800 font-bold text-2xl mb-2">Terjadi Kesalahan</h3>
            <p class="text-red-600 mb-4 text-lg">{{ error }}</p>
            <div class="flex gap-3 mt-6">
              <button @click="$router.go(-1)" class="flex-1 bg-gradient-to-r from-gray-600 to-gray-700 text-white px-6 py-3 rounded-xl hover:from-gray-700 hover:to-gray-800 transition font-bold shadow-lg">
                ← Kembali
              </button>
              <button @click="$router.go(0)" class="flex-1 bg-gradient-to-r from-[#FB6D00] to-[#FF8534] text-white px-6 py-3 rounded-xl hover:shadow-2xl transition font-bold shadow-lg">
                🔄 Muat Ulang
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Main Content -->
    <div v-else-if="umkmData" class="container mx-auto px-4 py-8 max-w-7xl">
      <!-- Back Button & Breadcrumb -->
      <div class="mb-8">
        <button @click="$router.go(-1)" class="inline-flex items-center gap-2 bg-white text-gray-700 hover:text-[#FB6D00] px-6 py-3 rounded-xl shadow-lg hover:shadow-xl transition-all font-semibold mb-4 border-2 border-transparent hover:border-[#FB6D00]">
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2.5">
            <path stroke-linecap="round" stroke-linejoin="round" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
          </svg>
          Kembali
        </button>
      </div>

      <!-- Hero Section dengan Gallery -->
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
        <!-- Left: Main Image Gallery (2 columns) -->
        <div class="lg:col-span-2">
          <div class="bg-white rounded-3xl shadow-2xl overflow-hidden h-full">
            
            <div class="relative h-[450px] bg-gradient-to-br from-gray-900 to-gray-800 overflow-hidden flex items-center justify-center">
              <img 
                v-if="galleryImages.length > 0" 
                :src="galleryImages[selectedImage]" 
                :alt="umkmData.nama_umkm"
                class="max-w-full max-h-full object-contain"
                @error="handleImageError"
              />
              <div v-else class="flex items-center justify-center h-full">
                <div class="text-center">
                  <svg class="w-32 h-32 mx-auto mb-4 animate-pulse" viewBox="0 0 24 24" fill="white">
                    <path d="M21 19V5c0-1.1-.9-2-2-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2zM8.5 13.5l2.5 3.01L14.5 12l4.5 6H5l3.5-4.5z"/>
                  </svg>
                  <span class="text-white text-2xl font-bold">Foto Tidak Tersedia</span>
                </div>
              </div>
              
              <!-- Overlay Gradient -->
              <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-black/30"></div>
              
              <!-- Counter Badge -->
              <div v-if="galleryImages.length > 0" class="absolute top-6 right-6 bg-[#FB6D00] text-white px-5 py-2 rounded-full font-bold text-sm shadow-2xl flex items-center gap-2">
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"/>
                </svg>
                {{ selectedImage + 1 }} / {{ galleryImages.length }}
              </div>

              <!-- Navigation -->
              <div v-if="galleryImages.length > 1" class="absolute inset-0 flex items-center justify-between px-4">
                <button @click="prevImage" class="w-12 h-12 bg-white/90 hover:bg-[#FB6D00] text-gray-800 hover:text-white rounded-full shadow-2xl transition-all duration-300 flex items-center justify-center">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="3">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7"/>
                  </svg>
                </button>
                <button @click="nextImage" class="w-12 h-12 bg-white/90 hover:bg-[#FB6D00] text-gray-800 hover:text-white rounded-full shadow-2xl transition-all duration-300 flex items-center justify-center">
                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="3">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7"/>
                  </svg>
                </button>
              </div>

            </div>

            <!-- Thumbnails -->
            <div v-if="galleryImages.length > 1" class="p-4 bg-white border-t-2 border-orange-200">
              <div class="flex gap-3 overflow-x-auto pb-2">
                <div 
                  v-for="(image, index) in galleryImages" 
                  :key="index"
                  @click="selectImage(index)"
                  class="relative flex-shrink-0 w-24 h-24 rounded-xl overflow-hidden cursor-pointer border-4 transition-all duration-300 shadow-md"
                  :class="selectedImage === index ? 'border-[#FB6D00] shadow-xl ring-2 ring-[#FB6D00]' : 'border-gray-300 hover:border-[#FB6D00]'"
                >
                  <img :src="image" :alt="`Foto ${index + 1}`" class="w-full h-full object-cover" @error="handleImageError"/>
                  <div v-if="selectedImage === index" class="absolute inset-0 bg-[#FB6D00]/20 flex items-center justify-center">
                    <div class="w-8 h-8 bg-[#FB6D00] rounded-full flex items-center justify-center text-white font-bold shadow-lg">✓</div>
                  </div>
                  <div class="absolute top-1 right-1 bg-black/70 text-white text-xs px-2 py-1 rounded-full font-bold">{{ index + 1 }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Right: Quick Info Card (1 column) -->
        <div class="lg:col-span-1">
          <div class="bg-white rounded-3xl shadow-2xl p-6 h-full">
            <div class="flex items-center gap-3 mb-6 pb-4 border-b-2 border-orange-100">
              <div class="w-12 h-12 bg-gradient-to-br from-[#FB6D00] to-[#FF8534] rounded-xl flex items-center justify-center shadow-lg">
                <svg class="w-7 h-7" viewBox="0 0 24 24" fill="white">
                  <path d="M3 13h8V3H3v10zm0 8h8v-6H3v6zm10 0h8V11h-8v10zm0-18v6h8V3h-8z"/>
                </svg>
              </div>
              <h3 class="text-xl font-bold text-gray-800">Info Cepat</h3>
            </div>

            <div class="space-y-4">
              <!-- Status Badge -->
              <div class="flex items-center justify-between p-4 bg-gradient-to-r from-orange-50 to-orange-100 rounded-2xl border-2 border-orange-200">
                <span class="text-gray-700 font-semibold flex items-center gap-2">
                  <svg class="w-6 h-6" viewBox="0 0 24 24" fill="#f97316">
                    <path d="M21.41 11.58l-9-9C12.05 2.22 11.55 2 11 2H4c-1.1 0-2 .9-2 2v7c0 .55.22 1.05.59 1.42l9 9c.36.36.86.58 1.41.58.55 0 1.05-.22 1.41-.59l7-7c.37-.36.59-.86.59-1.41 0-.55-.23-1.06-.59-1.42zM5.5 7C4.67 7 4 6.33 4 5.5S4.67 4 5.5 4 7 4.67 7 5.5 6.33 7 5.5 7z"/>
                  </svg>
                  Status
                </span>
                <span :class="getStatusClass(umkmData.status)" class="px-4 py-2 rounded-xl text-sm font-bold shadow-md">
                  {{ getStatusLabel(umkmData.status) }}
                </span>
              </div>

              <!-- Kota -->
              <div class="p-4 bg-gradient-to-r from-blue-50 to-blue-100 rounded-2xl border-2 border-blue-200">
                <div class="flex items-center gap-3 mb-2">
                  <svg class="w-6 h-6" viewBox="0 0 24 24" fill="#f97316">
                    <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                  </svg>
                  <span class="text-gray-600 font-semibold text-sm">Lokasi</span>
                </div>
                <p class="text-gray-900 font-bold text-lg">{{ umkmData.kota || '-' }}</p>
              </div>

              <!-- Karyawan -->
              <div class="p-4 bg-gradient-to-r from-green-50 to-green-100 rounded-2xl border-2 border-green-200">
                <div class="flex items-center gap-3 mb-2">
                  <svg class="w-6 h-6" viewBox="0 0 24 24" fill="#f97316">
                    <path d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5s-3 1.34-3 3 1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z"/>
                  </svg>
                  <span class="text-gray-600 font-semibold text-sm">Karyawan</span>
                </div>
                <p class="text-gray-900 font-bold text-lg">{{ umkmData.jumlah_karyawan || '0' }} Orang</p>
              </div>

              <!-- Jam Operasional -->
              <div class="p-4 bg-gradient-to-r from-yellow-50 to-yellow-100 rounded-2xl border-2 border-yellow-200">
                <div class="flex items-center gap-3 mb-2">
                  <svg class="w-6 h-6" viewBox="0 0 24 24" fill="#f97316">
                    <path d="M12 2C6.5 2 2 6.5 2 12s4.5 10 10 10 10-4.5 10-10S17.5 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67z"/>
                  </svg>
                  <span class="text-gray-600 font-semibold text-sm">Jam Buka</span>
                </div>
                <p class="text-gray-900 font-bold text-base">{{ umkmData.jam_operasional || '08:00 - 17:00' }}</p>
                <p class="text-gray-600 text-sm mt-1">{{ umkmData.hari_operasional || 'Senin - Jumat' }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Description Section -->
      <div class="bg-white rounded-3xl shadow-2xl p-8 mb-8">
        <div class="flex items-center gap-3 mb-6">
          <div class="w-12 h-12 bg-gradient-to-br from-[#FB6D00] to-[#FF8534] rounded-xl flex items-center justify-center shadow-lg">
            <svg class="w-7 h-7" viewBox="0 0 24 24" fill="white">
              <path d="M14 2H6c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6zm2 16H8v-2h8v2zm0-4H8v-2h8v2zm-3-5V3.5L18.5 9H13z"/>
            </svg>
          </div>
          <h2 class="text-2xl font-bold text-gray-800">Tentang UMKM</h2>
        </div>
        <div class="prose max-w-none">
          <p class="text-gray-700 text-lg leading-relaxed bg-gradient-to-r from-orange-50 to-transparent p-6 rounded-2xl border-l-4 border-[#FB6D00]">
            {{ umkmData.deskripsi || 'Deskripsi tidak tersedia untuk UMKM ini.' }}
          </p>
        </div>
      </div>

      <!-- Location & Contact Section -->
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <!-- Map Section -->
        <div class="bg-white rounded-3xl shadow-2xl p-8">
          <div class="flex items-center gap-3 mb-6">
            <div class="w-12 h-12 bg-gradient-to-br from-[#FB6D00] to-[#FF8534] rounded-xl flex items-center justify-center shadow-lg">
              <svg class="w-7 h-7" viewBox="0 0 24 24" fill="white">
                <path d="M20.5 3l-.16.03L15 5.1 9 3 3.36 4.9c-.21.07-.36.25-.36.48V20.5c0 .28.22.5.5.5l.16-.03L9 18.9l6 2.1 5.64-1.9c.21-.07.36-.25.36-.48V3.5c0-.28-.22-.5-.5-.5zM15 19l-6-2.11V5l6 2.11V19z"/>
              </svg>
            </div>
            <h2 class="text-2xl font-bold text-gray-800">Peta Lokasi</h2>
          </div>

          <!-- Map -->
          <div v-if="umkmData.map_url" class="rounded-2xl overflow-hidden shadow-xl h-72 mb-6 border-4 border-orange-100">
            <iframe 
              :src="umkmData.map_url" 
              width="100%" 
              height="100%" 
              style="border:0;" 
              allowfullscreen="" 
              loading="lazy">
            </iframe>
          </div>
          <div v-else class="bg-gradient-to-br from-gray-100 to-gray-200 rounded-2xl h-72 mb-6 flex items-center justify-center border-4 border-gray-300">
            <div class="text-center">
              <svg class="w-24 h-24 mx-auto mb-4" viewBox="0 0 24 24" fill="#9CA3AF">
                <path d="M20.5 3l-.16.03L15 5.1 9 3 3.36 4.9c-.21.07-.36.25-.36.48V20.5c0 .28.22.5.5.5l.16-.03L9 18.9l6 2.1 5.64-1.9c.21-.07.36-.25.36-.48V3.5c0-.28-.22-.5-.5-.5zM15 19l-6-2.11V5l6 2.11V19z"/>
              </svg>
              <span class="text-gray-600 text-xl font-bold">Peta Tidak Tersedia</span>
            </div>
          </div>

          <!-- Address Info -->
          <div class="space-y-4">
            <div class="bg-gradient-to-r from-orange-50 to-orange-100 rounded-2xl p-5 border-l-4 border-[#FB6D00]">
              <div class="flex items-start gap-3">
                <svg class="w-7 h-7 flex-shrink-0 mt-1" viewBox="0 0 24 24" fill="#f97316">
                  <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/>
                </svg>
                <div class="flex-1">
                  <p class="text-gray-600 font-bold mb-2 text-sm">Alamat Lengkap</p>
                  <p class="text-gray-900 font-semibold leading-relaxed">{{ umkmData.alamat || 'Alamat tidak tersedia' }}</p>
                </div>
              </div>
            </div>

            <div class="grid grid-cols-2 gap-4">
              <div class="bg-blue-50 rounded-xl p-4 border-2 border-blue-200">
                <p class="text-blue-600 font-bold mb-1 text-xs">Provinsi</p>
                <p class="text-gray-900 font-bold text-sm">{{ umkmData.provinsi || '-' }}</p>
              </div>
              <div class="bg-green-50 rounded-xl p-4 border-2 border-green-200">
                <p class="text-green-600 font-bold mb-1 text-xs">Kota/Kab</p>
                <p class="text-gray-900 font-bold text-sm">{{ umkmData.kota || '-' }}</p>
              </div>
            </div>
            <br>
            
            <!-- Google Maps Button -->
            <button 
              v-if="umkmData.google_maps_url" 
              @click="openMaps" 
              class="w-full bg-gradient-to-r from-[#FB6D00] to-[#FF8534] text-white py-4 rounded-2xl font-bold hover:shadow-2xl transition-all shadow-lg flex items-center justify-center gap-3 text-lg transform hover:scale-105 duration-300"
            >
              <svg class="w-6 h-6" viewBox="0 0 24 24" fill="currentColor">
                <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
              </svg>
              Buka Google Maps
            </button>
          </div>
        </div>

        <!-- Business Details -->
        <div class="bg-white rounded-3xl shadow-2xl p-8">
          <div class="flex items-center gap-3 mb-6">
            <div class="w-12 h-12 bg-gradient-to-br from-[#FB6D00] to-[#FF8534] rounded-xl flex items-center justify-center shadow-lg">
              <svg class="w-7 h-7" viewBox="0 0 24 24" fill="white">
                <path d="M20 6h-4V4c0-1.11-.89-2-2-2h-4c-1.11 0-2 .89-2 2v2H4c-1.11 0-1.99.89-1.99 2L2 19c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V8c0-1.11-.89-2-2-2zm-6 0h-4V4h4v2z"/>
              </svg>
            </div>
            <h2 class="text-2xl font-bold text-gray-800">Detail Usaha</h2>
          </div>

          <div class="space-y-4">
            <div class="bg-gradient-to-r from-orange-50 to-orange-100 rounded-2xl p-5 border-2 border-orange-200">
              <div class="flex justify-between items-center mb-3 pb-3 border-b-2 border-orange-200">
                <span class="text-gray-600 font-semibold flex items-center gap-2">
                  <svg class="w-5 h-5" viewBox="0 0 24 24" fill="#f97316">
                    <path d="M12 7V3H2v18h20V7H12zM6 19H4v-2h2v2zm0-4H4v-2h2v2zm0-4H4V9h2v2zm0-4H4V5h2v2zm4 12H8v-2h2v2zm0-4H8v-2h2v2zm0-4H8V9h2v2zm0-4H8V5h2v2zm10 12h-8v-2h2v-2h-2v-2h2v-2h-2V9h8v10zm-2-8h-2v2h2v-2zm0 4h-2v2h2v-2z"/>
                  </svg>
                  Jenis Usaha
                </span>
                <span class="text-gray-900 font-bold">{{ umkmData.jenis_usaha || '-' }}</span>
              </div>
              <div class="flex justify-between items-center mb-3 pb-3 border-b-2 border-orange-200">
                <span class="text-gray-600 font-semibold flex items-center gap-2">
                  <svg class="w-5 h-5" viewBox="0 0 24 24" fill="#f97316">
                    <path d="M21.41 11.58l-9-9C12.05 2.22 11.55 2 11 2H4c-1.1 0-2 .9-2 2v7c0 .55.22 1.05.59 1.42l9 9c.36.36.86.58 1.41.58.55 0 1.05-.22 1.41-.59l7-7c.37-.36.59-.86.59-1.41 0-.55-.23-1.06-.59-1.42zM5.5 7C4.67 7 4 6.33 4 5.5S4.67 4 5.5 4 7 4.67 7 5.5 6.33 7 5.5 7z"/>
                  </svg>
                  Kategori
                </span>
                <span class="text-gray-900 font-bold">{{ umkmData.kategori || '-' }}</span>
              </div>
              <div class="flex justify-between items-center">
                <span class="text-gray-600 font-semibold flex items-center gap-2">
                  <span class="text-xl">👥</span> Jumlah Karyawan
                </span>
                <span class="text-[#FB6D00] font-bold text-lg">{{ umkmData.jumlah_karyawan || '0' }} Orang</span>
              </div>
            </div>

            <!-- Operating Hours Card -->
            <div class="bg-gradient-to-br from-yellow-50 to-orange-50 rounded-2xl p-6 border-2 border-yellow-200">
              <div class="text-center">
                <div class="w-20 h-20 bg-gradient-to-br from-[#FB6D00] to-[#FF8534] rounded-full mx-auto mb-4 flex items-center justify-center text-4xl shadow-xl">
                  <svg class="w-10 h-10 flex-shrink-0" viewBox="0 0 24 24" fill="#ffffff">
                    <path d="M12 2C6.5 2 2 6.5 2 12s4.5 10 10 10 10-4.5 10-10S17.5 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67z"/>
                  </svg>
                </div>
                <h3 class="text-gray-700 font-bold mb-3 text-lg">Jam Operasional</h3>
                <div class="bg-white rounded-xl p-4 shadow-md border-2 border-orange-200">
                  <p class="text-3xl font-bold text-[#FB6D00] mb-2">{{ umkmData.jam_operasional || '08:00 - 17:00' }}</p>
                  <p class="text-gray-600 font-semibold">{{ umkmData.hari_operasional || 'Senin - Jumat' }}</p>
                </div>
              </div>
            </div>

            <!-- Status Card -->
            <div class="bg-gradient-to-br from-green-50 to-emerald-50 rounded-2xl p-6 border-2 border-green-200 text-center">
              <div class="flex items-center justify-center gap-3 mb-3">
                <span class="text-3xl">✅</span>
                <h3 class="text-gray-700 font-bold text-lg">Status Operasional</h3>
              </div>
              <span :class="getStatusClass(umkmData.status)" class="inline-block px-8 py-3 rounded-2xl text-base font-bold shadow-lg">
                {{ getStatusLabel(umkmData.status) }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- No Data State -->
    <div v-else class="container mx-auto px-4 py-20 max-w-2xl">
      <div class="bg-white border-l-8 border-yellow-500 rounded-3xl p-10 text-center shadow-2xl">
        <div class="w-24 h-24 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-full flex items-center justify-center text-white text-5xl mx-auto mb-6 shadow-xl">
          ⚠️
        </div>
        <h3 class="text-yellow-800 font-bold text-3xl mb-3">Data Tidak Ditemukan</h3>
        <p class="text-yellow-700 text-lg mb-8">UMKM dengan ID ini tidak tersedia dalam database kami</p>
        <button @click="$router.go(-1)" class="bg-gradient-to-r from-[#FB6D00] to-[#FF8534] text-white px-10 py-4 rounded-2xl hover:shadow-2xl transition-all font-bold shadow-lg text-lg transform hover:scale-105">
          ← Kembali ke Daftar
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';

const route = useRoute();
const router = useRouter();

const umkmData = ref(null);
const loading = ref(true);
const error = ref(null);
const selectedImage = ref(0);

// Data UMKM lokal (sama seperti di umkmsection.vue)
const umkmList = ref([
  // ID 1
  {
    id: 1,
    kapasitas: '10',
    nama_umkm: 'Warteg kokom',
    kategori: 'Menengah',
    jenis_usaha: 'Kuliner',
    deskripsi: 'Warteg Sikom merupakan usaha mikro yang bergerak di bidang kuliner, khususnya penyediaan makanan siap saji dengan konsep warung makan tradisional khas Indonesia. Usaha ini berfokus pada penyajian berbagai menu rumahan yang lezat, bergizi, dan terjangkau bagi masyarakat dari berbagai kalangan',
    provinsi: 'DKI Jakarta',
    map_url: '',
    google_maps_url: '',
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
    map_url: '',
    google_maps_url: '',
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
    map_url: '',
    google_maps_url: ''
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
    map_url: '',
    google_maps_url: ''
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
    map_url: '',
    google_maps_url: ''
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
    map_url: '',
    google_maps_url: ''
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
    map_url: '',
    google_maps_url: ''
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
    map_url: '',
    google_maps_url: ''
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
    map_url: '',
    google_maps_url: ''
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
    map_url: '',
    google_maps_url: ''
  }
]);

const galleryImages = computed(() => {
  const out = [];
  if (!umkmData.value) return out;
  
  const pushIfValid = (val) => {
    if (!val) return;
    
    if (typeof val === 'string') {
      const trimmed = val.trim();
      if (!trimmed) return;
      
      try {
        const parsed = JSON.parse(trimmed);
        if (Array.isArray(parsed)) {
          parsed.forEach((it) => { if (it) out.push(it); });
          return;
        }
      } catch (e) {}
      
      if (trimmed) out.push(trimmed);
      return;
    }
    
    if (Array.isArray(val)) {
      val.forEach((it) => { if (it) out.push(it); });
      return;
    }
  };

  pushIfValid(umkmData.value.foto_utama);
  pushIfValid(umkmData.value.galeri_foto);

  const uniq = Array.from(new Set(out.filter(Boolean).map(String)));
  return uniq;
});

watch(galleryImages, (val) => {
  if (selectedImage.value >= val.length) {
    selectedImage.value = Math.max(0, val.length - 1);
  }
});

const selectImage = (index) => {
  if (index < 0) index = galleryImages.value.length - 1;
  if (index >= galleryImages.value.length) index = 0;
  selectedImage.value = index;
};

const nextImage = () => {
  selectImage(selectedImage.value + 1);
};

const prevImage = () => {
  selectImage(selectedImage.value - 1);
};

const handleImageError = (event) => {
  event.target.src = 'https://via.placeholder.com/1200x600?text=Foto+Tidak+Tersedia';
};

const getStatusClass = (status) => {
  if (!status) return 'bg-gray-200 text-gray-700';
  const s = String(status).toLowerCase();
  if (s === 'aktif') return 'bg-green-500 text-white';
  if (s === 'tidak_aktif' || s === 'nonaktif' || s === 'tidak aktif') return 'bg-red-500 text-white';
  return 'bg-yellow-500 text-white';
};

const getStatusLabel = (status) => {
  if (!status) return 'Pending';
  const s = String(status).toLowerCase();
  if (s === 'aktif') return '✓ Aktif';
  if (s === 'tidak_aktif' || s === 'nonaktif' || s === 'tidak aktif') return '✗ Tidak Aktif';
  return 'Pending';
};

const openMaps = () => {
  if (umkmData.value && umkmData.value.google_maps_url) {
    window.open(umkmData.value.google_maps_url, '_blank', 'noopener,noreferrer');
  }
};

onMounted(() => {
  loading.value = true;
  error.value = null;
  
  try {
    // Ambil ID dari route params
    const id = parseInt(route.params.id);
    
    // Ambil data dari localStorage terlebih dahulu
    const storedData = localStorage.getItem('umkmList');
    if (storedData) {
      umkmList.value = JSON.parse(storedData);
    }
    
    // Cari data UMKM berdasarkan ID
    const foundUmkm = umkmList.value.find(umkm => umkm.id === id);
    
    if (foundUmkm) {
      umkmData.value = foundUmkm;
    } else {
      error.value = `UMKM dengan ID ${id} tidak ditemukan`;
    }
  } catch (err) {
    console.error('DetailView error:', err);
    error.value = 'Terjadi kesalahan saat memuat data.';
  } finally {
    // Simulasi loading untuk UX yang lebih baik
    setTimeout(() => {
      loading.value = false;
    }, 300);
  }
});
</script>