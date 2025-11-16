<template>
  <section class="bg-[#FB6D00] py-12 px-6 relative overflow-hidden">
 
    <div class="absolute inset-0 overflow-hidden pointer-events-none">
     
      <div class="absolute top-10 left-10 w-32 h-32 bg-white/5 rounded-full animate-float-slow"></div>
      <div class="absolute top-40 right-20 w-24 h-24 bg-white/5 rounded-full animate-float-medium"></div>
      <div class="absolute bottom-20 left-1/4 w-40 h-40 bg-white/5 rounded-full animate-float-fast"></div>
      <div class="absolute bottom-40 right-1/3 w-20 h-20 bg-white/5 rounded-full animate-float-slow"></div>
      
      <!-- Grid Pattern -->
      <div class="absolute inset-0 bg-grid-pattern opacity-5"></div>
    </div>

    <div class="max-w-5xl mx-auto text-center relative z-10">
      
      <div 
        class="inline-flex items-center justify-center w-16 h-16 bg-white/20 backdrop-blur-sm rounded-2xl mb-4 transition-all duration-500 hover:scale-110 hover:rotate-6"
        :class="isVisible ? 'animate-bounce-in' : 'opacity-0'"
      >
      <svg class="w-10 h-10 text-white" fill="none" stroke="currentColor" stroke-width="2"
     viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
  <path stroke-linecap="round" stroke-linejoin="round"
        d="M12 21s-6-5.686-6-10a6 6 0 1112 0c0 4.314-6 10-6 10z" />
  <circle cx="12" cy="11" r="2.5" stroke="currentColor" stroke-width="2" fill="none"/>
</svg>

      </div>

      <!-- Heading dengan animasi -->
      <h2 
        class="text-4xl md:text-5xl font-bold text-white mb-3 transition-all duration-700"
        :class="isVisible ? 'animate-fade-in-up' : 'opacity-0 translate-y-10'"
      >
        Tentang ASFAR
      </h2>

      <!-- Decorative Line -->
      <div 
        class="flex items-center justify-center gap-3 mb-4"
        :class="isVisible ? 'animate-fade-in' : 'opacity-0'"
        style="animation-delay: 400ms"
      >
        <div class="h-0.5 w-12 bg-white/40 rounded-full animate-pulse"></div>
        <div class="w-2 h-2 bg-white rounded-full animate-ping-slow"></div>
        <div class="h-0.5 w-12 bg-white/40 rounded-full animate-pulse"></div>
      </div>

      <!-- Subtitle dengan animasi -->
      <p 
        class="text-white text-base md:text-lg max-w-2xl mx-auto leading-relaxed transition-all duration-700"
        :class="isVisible ? 'animate-fade-in-up' : 'opacity-0 translate-y-10'"
        style="animation-delay: 200ms"
      >
        Platform Digital untuk Mendorong Pertumbuhan UMKM Lokal<br>
        dan Ekonomi Indonesia
      </p>

      <!-- Decorative Bottom Elements -->
      <div 
        class="flex items-center justify-center gap-4 mt-6"
        :class="isVisible ? 'animate-fade-in' : 'opacity-0'"
        style="animation-delay: 600ms"
      >
        <div class="flex items-center gap-2 bg-white/10 backdrop-blur-sm px-3 py-1.5 rounded-full hover:bg-white/20 transition-all duration-300 cursor-pointer group">
          <div class="w-1.5 h-1.5 bg-green-400 rounded-full animate-pulse"></div>
          <span class="text-white text-xs font-medium group-hover:scale-105 transition-transform">Platform Aktif</span>
        </div>
        
        <div class="flex items-center gap-2 bg-white/10 backdrop-blur-sm px-3 py-1.5 rounded-full hover:bg-white/20 transition-all duration-300 cursor-pointer group">
          <svg class="w-3.5 h-3.5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
          </svg>
          <span class="text-white text-xs font-medium group-hover:scale-105 transition-transform">Terpercaya</span>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'ASFARAboutSection',
  data() {
    return {
      isVisible: false
    }
  },
  mounted() {
    setTimeout(() => {
      this.isVisible = true
    }, 100)
  }
}
</script>

<style scoped>
/* Floating Animation */
@keyframes float-slow {
  0%, 100% {
    transform: translateY(0) translateX(0);
  }
  50% {
    transform: translateY(-20px) translateX(10px);
  }
}

@keyframes float-medium {
  0%, 100% {
    transform: translateY(0) translateX(0);
  }
  50% {
    transform: translateY(-30px) translateX(-15px);
  }
}

@keyframes float-fast {
  0%, 100% {
    transform: translateY(0) translateX(0);
  }
  50% {
    transform: translateY(-25px) translateX(20px);
  }
}

.animate-float-slow {
  animation: float-slow 8s ease-in-out infinite;
}

.animate-float-medium {
  animation: float-medium 6s ease-in-out infinite;
}

.animate-float-fast {
  animation: float-fast 7s ease-in-out infinite;
}

/* Bounce In Animation */
@keyframes bounce-in {
  0% {
    opacity: 0;
    transform: scale(0.3);
  }
  50% {
    opacity: 1;
    transform: scale(1.05);
  }
  70% {
    transform: scale(0.9);
  }
  100% {
    transform: scale(1);
  }
}

.animate-bounce-in {
  animation: bounce-in 0.8s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

/* Fade In Up Animation */
@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-fade-in-up {
  animation: fade-in-up 0.8s ease-out forwards;
}

/* Fade In Animation */
@keyframes fade-in {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.animate-fade-in {
  animation: fade-in 0.8s ease-out forwards;
}

/* Ping Slow Animation */
@keyframes ping-slow {
  0%, 100% {
    transform: scale(1);
    opacity: 1;
  }
  50% {
    transform: scale(1.5);
    opacity: 0.5;
  }
}

.animate-ping-slow {
  animation: ping-slow 3s cubic-bezier(0, 0, 0.2, 1) infinite;
}

/* Grid Pattern */
.bg-grid-pattern {
  background-image: 
    linear-gradient(to right, rgba(255, 255, 255, 0.1) 1px, transparent 1px),
    linear-gradient(to bottom, rgba(255, 255, 255, 0.1) 1px, transparent 1px);
  background-size: 50px 50px;
}
</style>