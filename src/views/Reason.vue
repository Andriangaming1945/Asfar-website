<template>
    <section class="flex flex-col md:flex-row">
        <!-- Image Side -->
        <div class="w-full md:w-1/2 h-64 md:h-auto">
            <img 
                :src="Promo" 
                alt="Promo Asfar" 
                class="w-full h-full object-cover"
            >
        </div>

        <!-- Content Side -->
        <div class="w-full md:w-1/2 bg-gradient-to-br from-[#FB4D03] to-[#FF6B35] px-6 md:px-12 py-8 md:py-12 flex flex-col justify-center">
            <h2 class="text-2xl md:text-3xl font-bold text-white mb-6">
                Mengapa Memilih <span class="text-yellow-300">Asfar?</span>
            </h2>
            
            <div class="space-y-4">
                <div 
                    v-for="(reason, index) in reasons" 
                    :key="index"
                    class="flex items-center gap-3 group hover:translate-x-1 transition-transform duration-300"
                >
                    <div class="flex-shrink-0 w-10 h-10 bg-white/20 rounded-full flex items-center justify-center backdrop-blur-sm group-hover:bg-white/30 transition-colors">
                        <img :src="Check" alt="" class="w-5 h-5">
                    </div>
                    <p class="text-white text-base md:text-lg font-semibold">
                        {{ reason }}
                    </p>
                </div>
            </div>
        </div>
    </section>
</template>

<script setup>
import Promo from '../components/icons/Promo.png'
import Check from '../components/icons/Check.png'

const reasons = [
    'Memperdayakan Ekonomi Lokal',
    'Produk Berkualitas dan Autentik',
    'Menciptakan Lapangan Kerja'
]
</script>