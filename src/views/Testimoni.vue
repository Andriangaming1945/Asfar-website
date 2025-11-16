<script setup>
import { ref, onMounted } from 'vue'

const bxLogo = new URL('../assets/manusia.png', import.meta.url).href
const isVisible = ref(false)

onMounted(() => {
  setTimeout(() => {
    isVisible.value = true
  }, 100)
})

const testimonials = [
  {
    name: "Bimosaurus",
    role: "Graphic Designer",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=Bimo",
    rating: 5,
    text: "I've used other kits, but this one is the best. The attention to detail and usability are truly amazing.",
    delay: "0ms"
  },
  {
    name: "Crystal Maiden",
    role: "UI/UX Designer",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=Crystal",
    rating: 5,
    text: "The quality of the design is top-notch, and I love how organized the files are. It's easy to find what I need.",
    delay: "150ms"
  },
  {
    name: "Dazzle Healer",
    role: "Front End Developer",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=Dazzle",
    rating: 5,
    text: "This kit exceeded my expectations! The components are versatile and make implementation much easier.",
    delay: "300ms"
  },
  {
    name: "Roshan Pro Max",
    role: "UI/UX Designer",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=Roshan",
    rating: 5,
    text: "Perfect for quick prototyping! The designs are professional and work seamlessly with my workflow.",
    delay: "450ms"
  },
  {
    name: "Mirana Marci",
    role: "3D Designer",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=Mirana",
    rating: 5,
    text: "I was blown away by how complete this UI kit is. It has everything I need, from assets to components.",
    delay: "600ms"
  },
  {
    name: "Hearts of Taras",
    role: "Logo Designer",
    avatar: "https://api.dicebear.com/7.x/avataaars/svg?seed=Hearts",
    rating: 5,
    text: "Amazing work! The color schemes are vibrant, and the icons fit perfectly with all my projects.",
    delay: "750ms"
  }
]
</script>

<template>
  <div class="py-16 px-4 sm:px-6 lg:px-[100px]">
    
  
    <div class="text-center mb-16">
      <div class="relative z-10 w-full max-w-7xl mx-auto flex flex-col items-center">
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
            Testimoni
          </span>
          <div class="w-2 h-2 bg-[#FB6D00] rounded-full animate-pulse"></div>
        </div>
      </div>
    </div>

  
    <div class="max-w-7xl mx-auto">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <div
          v-for="(testimonial, index) in testimonials"
          :key="index"
          :style="{ animationDelay: testimonial.delay }"
          :class="[
            'testimonial-card bg-white rounded-3xl p-6 shadow-lg transition-all duration-500',
            'hover:shadow-2xl transform hover:-translate-y-3 hover:scale-105',
            'animate-float',
            isVisible ? 'animate-fade-in-up opacity-100' : 'opacity-0'
          ]"
        >
          <!-- Avatar & Name -->
          <div class="flex items-center gap-4 mb-4">
            <div class="relative group">
              <div class="absolute inset-0 bg-orange-400 rounded-full blur-md opacity-30 group-hover:opacity-70 transition-opacity animate-pulse-glow"></div>
              <img
                :src="testimonial.avatar"
                :alt="testimonial.name"
                class="relative w-16 h-16 rounded-full border-4 border-orange-100 shadow-md transition-transform duration-300 group-hover:scale-110 group-hover:rotate-12 animate-bounce-subtle"
              />
            </div>
            <div>
              <h3 class="font-bold text-lg text-gray-800">{{ testimonial.name }}</h3>
              <p class="text-sm text-gray-500">{{ testimonial.role }}</p>
            </div>
          </div>

          <!-- Rating Stars dengan animasi bergerak -->
          <div class="flex gap-1 mb-4">
            <svg
              v-for="star in testimonial.rating"
              :key="star"
              class="w-5 h-5 text-orange-500 animate-star-twinkle"
              :style="{ animationDelay: `${star * 150}ms` }"
              fill="currentColor"
              viewBox="0 0 20 20"
            >
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
          </div>

          <!-- Testimonial Text -->
          <p class="text-gray-600 leading-relaxed">
            {{ testimonial.text }}
          </p>

          <!-- Decorative Quote dengan animasi gerak -->
          <div class="absolute top-4 right-4 text-orange-200 opacity-20 animate-quote-float">
            <svg class="w-12 h-12" fill="currentColor" viewBox="0 0 24 24">
              <path d="M14.017 21v-7.391c0-5.704 3.731-9.57 8.983-10.609l.995 2.151c-2.432.917-3.995 3.638-3.995 5.849h4v10h-9.983zm-14.017 0v-7.391c0-5.704 3.748-9.57 9-10.609l.996 2.151c-2.433.917-3.996 3.638-3.996 5.849h3.983v10h-9.983z"/>
            </svg>
          </div>

          <!-- Shimmer effect bergerak -->
          <div class="shimmer-effect"></div>
        </div>
      </div>
    </div>

  </div>
</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500;600;700;800;900&display=swap');

.font-poppins {
  font-family: 'Poppins', sans-serif;
}

/* Animasi Fade In Up */
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(40px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Animasi Float - Card melayang naik turun */
@keyframes float {
  0%, 100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-10px);
  }
}

/* Animasi Bounce Subtle - Avatar bergerak halus */
@keyframes bounceSubtle {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-5px);
  }
}

/* Animasi Star Twinkle - Bintang berkedip dan scale */
@keyframes starTwinkle {
  0%, 100% {
    transform: scale(1);
    opacity: 1;
  }
  50% {
    transform: scale(1.2);
    opacity: 0.7;
  }
}

/* Animasi Quote Float - Quote mark bergerak melayang */
@keyframes quoteFloat {
  0%, 100% {
    transform: translate(0, 0) rotate(0deg);
  }
  25% {
    transform: translate(5px, -5px) rotate(3deg);
  }
  50% {
    transform: translate(0, -10px) rotate(0deg);
  }
  75% {
    transform: translate(-5px, -5px) rotate(-3deg);
  }
}

/* Animasi Pulse Glow - Cahaya berdenyut */
@keyframes pulseGlow {
  0%, 100% {
    opacity: 0.3;
    transform: scale(1);
  }
  50% {
    opacity: 0.7;
    transform: scale(1.1);
  }
}

/* Shimmer Effect - Cahaya bergerak dari kiri ke kanan */
@keyframes shimmer {
  0% {
    transform: translateX(-100%) rotate(45deg);
  }
  100% {
    transform: translateX(200%) rotate(45deg);
  }
}

.animate-fade-in-up {
  animation: fadeInUp 0.8s ease-out forwards;
}

.animate-float {
  animation: float 3s ease-in-out infinite;
}

.animate-bounce-subtle {
  animation: bounceSubtle 2s ease-in-out infinite;
}

.animate-star-twinkle {
  animation: starTwinkle 2s ease-in-out infinite;
}

.animate-quote-float {
  animation: quoteFloat 4s ease-in-out infinite;
}

.animate-pulse-glow {
  animation: pulseGlow 2s ease-in-out infinite;
}

.testimonial-card {
  position: relative;
  overflow: hidden;
}

/* Shimmer effect pada hover */
.shimmer-effect {
  position: absolute;
  top: 0;
  left: -100%;
  width: 50%;
  height: 100%;
  background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
  pointer-events: none;
}

.testimonial-card:hover .shimmer-effect {
  animation: shimmer 1.5s ease-in-out;
}

/* Stagger animation untuk setiap card */
.testimonial-card:nth-child(1) { animation-delay: 0ms; }
.testimonial-card:nth-child(2) { animation-delay: 150ms; }
.testimonial-card:nth-child(3) { animation-delay: 300ms; }
.testimonial-card:nth-child(4) { animation-delay: 450ms; }
.testimonial-card:nth-child(5) { animation-delay: 600ms; }
.testimonial-card:nth-child(6) { animation-delay: 750ms; }
</style>