<template>
  <div>
  
    <nav 
      class="bg-white transition-all duration-300 ease-in-out fixed top-0 left-0 right-0 z-50"
      :class="isScrolled ? 'shadow-lg bg-white/95 backdrop-blur-sm' : 'shadow-sm'"
    >
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
        
          <div 
            class="flex items-center gap-3 transition-all duration-700 ease-out"
            :class="showNavbar ? 'translate-x-0 opacity-100' : '-translate-x-20 opacity-0'"
          >
          <div class="bg-gradient-to-br from-[#FB6D00] to-[#FB4D03] rounded-xl p-3 hover:scale-110 hover:rotate-6 transition-all duration-300 cursor-pointer">
  <svg class="w-9 h-9 text-white" fill="none" stroke="currentColor" stroke-width="2"
       viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
    <path stroke-linecap="round" stroke-linejoin="round"
          d="M12 21s-6-5.686-6-10a6 6 0 1112 0c0 4.314-6 10-6 10z" />
    <circle cx="12" cy="11" r="2.5" stroke="currentColor" stroke-width="2" fill="none"/>
  </svg>
</div>

            <div>
              <h1 class="text-2xl font-bold bg-gradient-to-r from-[#FB6D00] to-[#FB4D03] bg-clip-text text-transparent hover:scale-105 transition-transform duration-300 cursor-pointer">
                A.S.F.A.R
              </h1>
              <p class="text-xs text-gray-600">Aksi Sistem Finder dan Area Rintisan</p>
            </div>
          </div>

        
          <div class="hidden md:flex items-center gap-8">
            <a 
              v-for="(item, index) in menuItems"
              :key="item.text"
              :href="item.to"
              @click="smoothScrollTo($event, item.to)"
              class="text-gray-700 hover:text-[#FB6D00] transition-all duration-300 font-medium hover:scale-110 hover:-translate-y-1"
              :style="{
                transitionDelay: showNavbar ? `${(index + 1) * 100}ms` : '0ms',
                opacity: showNavbar ? 1 : 0,
                transform: showNavbar ? 'translateY(0)' : 'translateY(-20px)'
              }"
            >
              {{ item.text }}
            </a>
            <button 
              class="bg-gradient-to-r from-[#FB6D00] to-[#FB4D03] hover:from-[#FB4D03] hover:to-[#FB6D00] text-white px-6 py-2.5 rounded-lg font-medium transition-all duration-300 shadow-md hover:shadow-2xl hover:scale-110 hover:-translate-y-2 active:scale-95 relative overflow-hidden group"
              :style="{
                transitionDelay: showNavbar ? '500ms' : '0ms',
                opacity: showNavbar ? 1 : 0,
                transform: showNavbar ? 'translateY(0)' : 'translateY(-20px)'
              }"
            >
              <span class="relative z-10">Hubungi kami</span>
              <span class="absolute inset-0 bg-white opacity-0 group-hover:opacity-20 transition-opacity duration-300"></span>
            </button>
          </div>

         
          <button
            @click="toggleMobileMenu"
            class="md:hidden p-2 rounded-lg hover:bg-gray-100 transition-all duration-700 ease-out active:scale-90"
            :class="showNavbar ? 'translate-x-0 opacity-100' : 'translate-x-20 opacity-0'"
          >
            <svg 
              :class="mobileMenuOpen ? 'rotate-180 scale-110' : 'rotate-0 scale-100'" 
              class="w-6 h-6 transition-all duration-500 ease-out" 
              fill="none" 
              stroke="currentColor" 
              viewBox="0 0 24 24"
            >
              <path 
                v-if="!mobileMenuOpen"
                stroke-linecap="round" 
                stroke-linejoin="round" 
                stroke-width="2" 
                d="M4 6h16M4 12h16M4 18h16"
                class="transition-all duration-300"
              />
              <path 
                v-else
                stroke-linecap="round" 
                stroke-linejoin="round" 
                stroke-width="2" 
                d="M6 18L18 6M6 6l12 12"
                class="transition-all duration-300"
              />
            </svg>
          </button>
        </div>

        <!-- Mobile Menu -->
        <transition
          enter-active-class="transition-all duration-500 ease-out"
          enter-from-class="opacity-0 -translate-y-4"
          enter-to-class="opacity-100 translate-y-0"
          leave-active-class="transition-all duration-300 ease-in"
          leave-from-class="opacity-100 translate-y-0"
          leave-to-class="opacity-0 -translate-y-4"
        >
          <div v-if="mobileMenuOpen" class="md:hidden py-4 border-t border-gray-100 overflow-hidden">
            <div class="flex flex-col gap-2">
              <a 
                v-for="(item, index) in menuItems"
                :key="item.text"
                :href="item.to"
                @click="smoothScrollTo($event, item.to)"
                class="text-gray-700 hover:text-white hover:bg-gradient-to-r hover:from-[#FB6D00] hover:to-[#FB4D03] px-4 py-3 rounded-lg transition-all duration-300 font-medium transform hover:translate-x-2"
                :class="mobileMenuOpen ? 'animate-slideInMobile' : ''"
                :style="{ animationDelay: `${index * 80}ms` }"
              >
                {{ item.text }}
              </a>
              <button 
                @click="closeMobileMenu"
                class="bg-gradient-to-r from-[#FB6D00] to-[#FB4D03] hover:from-[#FB4D03] hover:to-[#FB6D00] text-white px-6 py-3.5 rounded-lg font-medium transition-all duration-300 shadow-lg hover:shadow-2xl hover:scale-[1.02] active:scale-95 relative overflow-hidden group mt-2"
                :class="mobileMenuOpen ? 'animate-slideInMobile' : ''"
                :style="{ animationDelay: `${menuItems.length * 80}ms` }"
              >
                <span class="relative z-10">Hubungi kami</span>
                <span class="absolute inset-0 bg-white opacity-0 group-hover:opacity-20 transition-opacity duration-300"></span>
              </button>
            </div>
          </div>
        </transition>
      </div>
    </nav>

    
    <div class="h-20"></div>
  </div>
</template>

<script>
export default {
  name: 'ASFARNavbar',
  data() {
    return {
      mobileMenuOpen: false,
      showNavbar: false,
      isScrolled: false,
      menuItems: [
        { text: 'Beranda', to: '#Beranda' },
        { text: 'UMKM Kami', to: '#UMKM' },
        { text: 'Testimoni', to: '#Testimoni' },
        { text: 'Daftar UMKM', to: '#Daftar' }
      ]
    }
  },
  mounted() {
    setTimeout(() => {
      this.showNavbar = true
    }, 100)

    window.addEventListener('scroll', this.handleScroll, { passive: true })
    
    // Handle scroll saat halaman pertama kali dimuat dengan hash
    this.scrollToHashOnLoad()
  },
  beforeUnmount() {
    window.removeEventListener('scroll', this.handleScroll)
  },
  watch: {
    '$route'(to) {
      // Handle scroll saat route berubah dan ada hash
      if (to.hash) {
        this.$nextTick(() => {
          this.scrollToElement(to.hash)
        })
      }
    }
  },
  methods: {
    handleScroll() {
      this.isScrolled = window.scrollY > 50
    },
    toggleMobileMenu() {
      this.mobileMenuOpen = !this.mobileMenuOpen
    },
    closeMobileMenu() {
      this.mobileMenuOpen = false
    },
    scrollToHashOnLoad() {
      const hash = window.location.hash
      if (hash) {
        setTimeout(() => {
          this.scrollToElement(hash)
        }, 300)
      }
    },
    scrollToElement(hash) {
      const element = document.querySelector(hash)
      if (element) {
        const navbarHeight = 80
        const elementPosition = element.getBoundingClientRect().top + window.pageYOffset
        const offsetPosition = elementPosition - navbarHeight

        window.scrollTo({
          top: offsetPosition,
          behavior: 'smooth'
        })
      }
    },
    smoothScrollTo(event, target) {
      event.preventDefault()
   
      if (this.$route.path !== '/') {
        this.$router.push({ path: '/', hash: target })
      } else {
        this.scrollToElement(target)
      }
      
      this.closeMobileMenu()
    }
  }
}
</script>

<style scoped>
@keyframes slideInMobile {
  from {
    opacity: 0;
    transform: translateX(-30px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

.animate-slideInMobile {
  animation: slideInMobile 0.5s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
  opacity: 0;
}

html {
  scroll-behavior: smooth;
}
</style>