<template>
    <section id="logo" class="w-full flex px-6 ">
        <img :src="BagLogo" alt="Logo"
            class="w-20 h-20 bg-linear-to-r from-[#FB6D00] to-[#FB4D03] p-3 rounded-2xl mr-5">
        <div>
            <p :class="['text-[#fc7911]', 'font-bold', TextSize, 'transition-all', 'duration-300']" class="pt-2">
                {{ Title }}
            </p>
            <p class="text-gray-500">Aksi Sistem Finansial dan Area Rintisan</p>
        </div>

    </section>

</template>
<script setup>
import { ref } from 'vue';
import BagLogo from '@/components/icons/BagLogo.png'
defineProps({
    Title: {
        type: String,
        default: "",
        required: true
    },
    TextSize: {
        type: String,
        default: "text-5xl",
    }
})


</script>