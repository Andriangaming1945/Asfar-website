<template>
  <div
    class="relative min-h-screen bg-cover bg-fixed bg-center flex items-center justify-center overflow-hidden"
    style="background-image: url('/f.jpg');"
  >
   
    <div class="absolute inset-0 bg-black/60 animate-fade-in"></div>

    <div class="absolute inset-0 overflow-hidden">
      <div class="hero-particle particle-1"></div>
      <div class="hero-particle particle-2"></div>
      <div class="hero-particle particle-3"></div>
      <div class="hero-particle particle-4"></div>
    </div>

   
    <div class="relative z-10 w-full px-4 sm:px-6 md:px-8 max-w-5xl mx-auto text-center py-16 sm:py-20">
     
      <div class="inline-flex items-center gap-2 bg-gradient-to-r from-[#FB6D00] to-[#FB4D03] text-white px-4 sm:px-6 py-2 sm:py-2.5 rounded-full mb-8 sm:mb-10 animate-slide-down shadow-lg text-xs sm:text-sm animate-pulse-glow">
        <svg class="w-4 h-4 sm:w-5 sm:h-5 animate-spin-slow flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z" />
        </svg>
        <span class="font-semibold tracking-wide">✨ UMKM Lokal Terbaik Indonesia</span>
      </div>

   
      <h1 class="text-3xl sm:text-4xl md:text-5xl lg:text-6xl xl:text-7xl font-bold text-white drop-shadow-2xl mb-6 sm:mb-8 leading-tight tracking-wide px-2">
        <span class="block animate-fade-in-up mb-2 sm:mb-3" style="animation-delay: 0.2s">Jelajahi & Temukan</span>
        <span class="block text-transparent bg-clip-text bg-gradient-to-r from-[#FB6D00] via-[#FFA500] to-[#FB4D03] animate-fade-in-up my-2" style="animation-delay: 0.4s">
          UMKM Lokal Terbaik
        </span>
        <span class="block animate-fade-in-up mt-2 sm:mt-3" style="animation-delay: 0.6s">Di Seluruh Indonesia</span>
      </h1>

      <p class="text-white/90 text-sm sm:text-base md:text-lg lg:text-xl mb-8 sm:mb-10 leading-relaxed drop-shadow-lg animate-fade-in-up max-w-3xl mx-auto px-4" style="animation-delay: 0.8s">
        Temukan dan tracking lokasi UMKM di sekitar Anda. Daftarkan UMKM Anda untuk dijangkau lebih luas oleh pelanggan lokal.
      </p>

    
      <div class="flex flex-col sm:flex-row gap-3 sm:gap-4 justify-center animate-fade-in-up px-4" style="animation-delay: 1s">
        <button class="group relative bg-gradient-to-r from-[#FB6D00] to-[#FB4D03] hover:from-[#FB4D03] hover:to-[#FB6D00] text-white px-6 sm:px-8 py-3 sm:py-4 rounded-xl font-bold text-base sm:text-lg transition-all duration-300 shadow-2xl hover:shadow-orange-500/50 hover:scale-105 hover:-translate-y-1 active:scale-95 overflow-hidden w-full sm:w-auto animate-button-pulse">
          <span class="relative z-10 flex items-center justify-center gap-2">
            Mulai Menjelajahi
            <svg class="w-4 h-4 sm:w-5 sm:h-5 group-hover:translate-x-1 transition-transform flex-shrink-0 animate-arrow-bounce" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6" />
            </svg>
          </span>
          <div class="absolute inset-0 bg-white opacity-0 group-hover:opacity-20 transition-opacity"></div>
        </button>

        <a href="https://youtu.be/dvskgC9DM5Q?si=YNrqlTKi18B2PNS7"
   target="_blank"
   rel="noopener noreferrer">
  <button class="group relative bg-white/10 backdrop-blur-md border-2 border-white/30 hover:bg-white/20 text-white px-6 sm:px-8 py-3 sm:py-4 rounded-xl font-bold text-base sm:text-lg transition-all duration-200 shadow-xl hover:shadow-2xl hover:scale-105 hover:-translate-y-1 active:scale-95 w-full sm:w-auto animate-border-glow">
    <span class="flex items-center justify-center gap-2">
      <svg class="w-4 h-4 sm:w-5 sm:h-5 group-hover:scale-110 transition-transform duration-200 flex-shrink-0 animate-play-pulse" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z"/>
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
      </svg>
      Lihat Video
    </span>
  </button>
</a>

      </div>
    </div>

   
    <div class="absolute bottom-6 sm:bottom-8 left-1/2 -translate-x-1/2 animate-bounce z-10">
      <svg class="w-5 h-5 sm:w-6 sm:h-6 text-white/60" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3" />
      </svg>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ASFARHeroSection'
}
</script>

<style scoped>
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes floatHero {
  0%, 100% {
    transform: translateY(0) translateX(0);
  }
  50% {
    transform: translateY(-30px) translateX(20px);
  }
}

@keyframes spinSlow {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

@keyframes pulseGlow {
  0%, 100% {
    box-shadow: 0 0 20px rgba(251, 109, 0, 0.5);
    transform: scale(1);
  }
  50% {
    box-shadow: 0 0 30px rgba(251, 109, 0, 0.8);
    transform: scale(1.02);
  }
}

@keyframes buttonPulse {
  0%, 100% {
    box-shadow: 0 10px 40px rgba(251, 109, 0, 0.4);
  }
  50% {
    box-shadow: 0 10px 50px rgba(251, 109, 0, 0.6);
  }
}

@keyframes borderGlow {
  0%, 100% {
    border-color: rgba(255, 255, 255, 0.3);
    box-shadow: 0 0 15px rgba(255, 255, 255, 0.2);
  }
  50% {
    border-color: rgba(255, 255, 255, 0.6);
    box-shadow: 0 0 25px rgba(255, 255, 255, 0.4);
  }
}

@keyframes arrowBounce {
  0%, 100% {
    transform: translateX(0);
  }
  50% {
    transform: translateX(5px);
  }
}

@keyframes playPulse {
  0%, 100% {
    transform: scale(1);
    opacity: 1;
  }
  50% {
    transform: scale(1.1);
    opacity: 0.8;
  }
}

.animate-fade-in {
  animation: fadeIn 1s ease-out;
}

.animate-fade-in-up {
  animation: fadeInUp 0.8s ease-out backwards;
}

.animate-slide-down {
  animation: slideDown 0.8s ease-out;
}

.animate-spin-slow {
  animation: spinSlow 3s linear infinite;
}

.animate-pulse-glow {
  animation: pulseGlow 2s ease-in-out infinite;
}

.animate-button-pulse {
  animation: buttonPulse 2s ease-in-out infinite;
}

.animate-border-glow {
  animation: borderGlow 2.5s ease-in-out infinite;
}

.animate-arrow-bounce {
  animation: arrowBounce 1.5s ease-in-out infinite;
}

.animate-play-pulse {
  animation: playPulse 2s ease-in-out infinite;
}

/* Hero particles */
.hero-particle {
  position: absolute;
  background: radial-gradient(circle, rgba(251, 109, 0, 0.3), transparent);
  border-radius: 50%;
  animation: floatHero ease-in-out infinite;
  pointer-events: none;
}

.particle-1 {
  width: 150px;
  height: 150px;
  top: 10%;
  left: 10%;
  animation-duration: 8s;
}

.particle-2 {
  width: 100px;
  height: 100px;
  top: 60%;
  right: 15%;
  animation-duration: 10s;
  animation-delay: 2s;
}

.particle-3 {
  width: 120px;
  height: 120px;
  bottom: 20%;
  left: 20%;
  animation-duration: 12s;
  animation-delay: 4s;
}

.particle-4 {
  width: 80px;
  height: 80px;
  top: 30%;
  right: 25%;
  animation-duration: 9s;
  animation-delay: 1s;
}

@media (max-width: 768px) {
  .hero-particle {
    display: none;
  }
}
</style>