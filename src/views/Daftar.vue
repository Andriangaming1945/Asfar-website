<template>
  <div class="card-wrapper flex items-center justify-center px-4 sm:px-6 md:px-12 lg:px-20 xl:px-[100px] py-6 sm:py-8 md:py-10 lg:py-[40px]">
    <div class="mt-12 sm:mt-16 md:mt-20"></div>

   
    <div
      class="relative bg-gradient-to-br from-[#FB6D00] to-[#FB4D03] rounded-2xl sm:rounded-3xl lg:rounded-[28px] text-center shadow-lg sm:shadow-xl lg:shadow-[0_20px_60px_rgba(251,77,3,0.25)] max-w-[1298px] w-full mx-auto overflow-hidden px-5 sm:px-8 md:px-12 lg:px-16 xl:px-[90px] pt-10 sm:pt-12 md:pt-16 lg:pt-20 xl:pt-[90px] pb-8 sm:pb-10 md:pb-12 lg:pb-16 xl:pb-[70px]"
    >
      
      <div class="absolute rounded-full bg-white/10 pointer-events-none w-48 h-48 sm:w-64 sm:h-64 md:w-80 md:h-80 lg:w-[400px] lg:h-[400px] top-[-80px] sm:top-[-100px] md:top-[-120px] lg:top-[-150px] right-[-80px] sm:right-[-100px] md:right-[-120px] lg:right-[-150px]"></div>
      <div class="absolute rounded-full bg-white/10 pointer-events-none w-40 h-40 sm:w-48 sm:h-48 md:w-56 md:h-56 lg:w-[300px] lg:h-[300px] bottom-[-60px] sm:bottom-[-70px] md:bottom-[-80px] lg:bottom-[-100px] left-[-60px] sm:left-[-70px] md:left-[-80px] lg:left-[-100px]"></div>

 
      <h1 class="text-white text-2xl sm:text-3xl md:text-4xl lg:text-5xl xl:text-[50px] font-bold mb-4 sm:mb-5 md:mb-6 lg:mb-7 xl:mb-[28px] leading-tight sm:leading-tight md:leading-tight lg:leading-[1.25] relative z-[1] tracking-tight lg:tracking-[-0.5px] px-2">
        Punya UMKM? Bergabunglah dengan Kami!
      </h1>

    
      <p class="text-white/95 text-sm sm:text-base md:text-lg lg:text-xl xl:text-[26px] font-normal mb-6 sm:mb-7 md:mb-8 lg:mb-10 xl:mb-[45px] leading-relaxed sm:leading-relaxed md:leading-relaxed lg:leading-[1.6] relative z-[1] px-2">
        Daftarkan UMKM anda dan jangkau ribuan pelanggan
        <span class="hidden sm:inline"><br /></span>
        <span class="sm:hidden"> </span>
        potensial di seluruh Indonesia
      </p>

      
      <router-link
        to="/umkm"
        class="inline-block bg-white text-[#FF6B2B] text-base sm:text-lg md:text-xl lg:text-2xl xl:text-[24px] font-bold py-3 sm:py-3.5 md:py-4 lg:py-5 xl:py-[22px] px-8 sm:px-10 md:px-12 lg:px-14 xl:px-[60px] rounded-full shadow-md sm:shadow-lg lg:shadow-[0_10px_25px_rgba(0,0,0,0.15)] relative z-[1] mb-8 sm:mb-9 md:mb-10 lg:mb-12 xl:mb-[50px] no-underline transition-all duration-300 hover:-translate-y-[2px] hover:shadow-xl lg:hover:shadow-[0_15px_35px_rgba(0,0,0,0.2)] active:translate-y-0"
      >
        Daftar UMKM mu sekarang
      </router-link>

      
      <div class="flex justify-center flex-wrap gap-3 sm:gap-4 md:gap-5 lg:gap-7 xl:gap-[35px] relative z-[1] mt-0 px-2">
        <div class="flex items-center gap-2 sm:gap-2.5 lg:gap-[10px] bg-white/15 py-2 sm:py-2.5 md:py-3 lg:py-[12px] px-4 sm:px-5 md:px-6 lg:px-[24px] rounded-full sm:rounded-3xl lg:rounded-[30px] text-white text-xs sm:text-sm md:text-base lg:text-[16px] font-medium backdrop-blur-[10px] border border-white/20">
          <span class="text-sm sm:text-base md:text-lg lg:text-[18px] font-bold">✓</span>
          <span>Gratis Pendaftaran</span>
        </div>
        <div class="flex items-center gap-2 sm:gap-2.5 lg:gap-[10px] bg-white/15 py-2 sm:py-2.5 md:py-3 lg:py-[12px] px-4 sm:px-5 md:px-6 lg:px-[24px] rounded-full sm:rounded-3xl lg:rounded-[30px] text-white text-xs sm:text-sm md:text-base lg:text-[16px] font-medium backdrop-blur-[10px] border border-white/20">
          <span class="text-sm sm:text-base md:text-lg lg:text-[18px] font-bold">✓</span>
          <span>Proses Mudah</span>
        </div>
        <div class="flex items-center gap-2 sm:gap-2.5 lg:gap-[10px] bg-white/15 py-2 sm:py-2.5 md:py-3 lg:py-[12px] px-4 sm:px-5 md:px-6 lg:px-[24px] rounded-full sm:rounded-3xl lg:rounded-[30px] text-white text-xs sm:text-sm md:text-base lg:text-[16px] font-medium backdrop-blur-[10px] border border-white/20">
          <span class="text-sm sm:text-base md:text-lg lg:text-[18px] font-bold">✓</span>
          <span>Jangkauan Luas</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ASFARCard'
}
</script>

