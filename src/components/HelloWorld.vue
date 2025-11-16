<script>
import Navbar from './components/Navbar.vue';
import { RouterView } from 'vue-router';
import About from './views/About.vue';
import umkmsection from './views/umkmsection.vue';
import Testimoni from './views/Testimoni.vue';
import Daftar from './views/Daftar.vue';

export default {
  name: 'App',
  components: {
    Navbar,
    RouterView,
    About,
    umkmsection,
    Testimoni,
    Daftar
}
};
</script>

<template>
  <div class="relative min-h-screen bg-gradient-to-br from-[#FFF8E7] via-[#FFF3D9] to-[#FFE8C5]">
   
    <!-- Parallax Background - FIXED to cover full page -->
    <div class="parallax-bg fixed inset-0 pointer-events-none -z-10">
      <div class="parallax-circle parallax-circle-1"></div>
      <div class="parallax-circle parallax-circle-2"></div>
      <div class="parallax-circle parallax-circle-3"></div>
      <div class="parallax-dot parallax-dot-1"></div>
      <div class="parallax-dot parallax-dot-2"></div>
      <div class="parallax-dot parallax-dot-3"></div>
      <div class="parallax-dot parallax-dot-4"></div>
      <div class="parallax-star parallax-star-1">✦</div>
      <div class="parallax-star parallax-star-2">✧</div>
      <div class="parallax-star parallax-star-3">✦</div>
      <div class="parallax-star parallax-star-4">✧</div>
    </div>

 
    <div class="relative z-10">
      <Navbar />
      <RouterView />
      <About />
      <umkmsection />
      <Testimoni />
      <Daftar />
    </div>
  </div>
</template>

<style scoped>

.parallax-bg {
  z-index: 0;
}

.parallax-circle {
  position: absolute;
  border-radius: 50%;
  background: linear-gradient(135deg, rgba(251, 109, 0, 0.12), rgba(255, 243, 217, 0.15));
  filter: blur(60px);
}

.parallax-circle-1 {
  width: 500px;
  height: 500px;
  top: -150px;
  right: -150px;
  animation: float1 25s ease-in-out infinite;
}

.parallax-circle-2 {
  width: 400px;
  height: 400px;
  bottom: -120px;
  left: -120px;
  animation: float2 30s ease-in-out infinite;
}

.parallax-circle-3 {
  width: 350px;
  height: 350px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  animation: float3 35s ease-in-out infinite;
}

.parallax-dot {
  position: absolute;
  border-radius: 50%;
  background: linear-gradient(135deg, rgba(251, 109, 0, 0.2), rgba(241, 90, 36, 0.15));
  box-shadow: 0 0 30px rgba(251, 109, 0, 0.1);
}

.parallax-dot-1 {
  width: 100px;
  height: 100px;
  top: 15%;
  left: 10%;
  animation: drift1 18s ease-in-out infinite;
}

.parallax-dot-2 {
  width: 80px;
  height: 80px;
  top: 70%;
  right: 15%;
  animation: drift2 22s ease-in-out infinite;
}

.parallax-dot-3 {
  width: 60px;
  height: 60px;
  top: 40%;
  right: 25%;
  animation: drift3 26s ease-in-out infinite;
}

.parallax-dot-4 {
  width: 70px;
  height: 70px;
  bottom: 20%;
  left: 20%;
  animation: drift4 24s ease-in-out infinite;
}

.parallax-star {
  position: absolute;
  font-size: 24px;
  color: #FB6D00;
  opacity: 0.3;
  animation: twinkle 3s ease-in-out infinite;
}

.parallax-star-1 {
  top: 20%;
  left: 15%;
  animation-delay: 0s;
}

.parallax-star-2 {
  top: 60%;
  right: 20%;
  animation-delay: 1s;
}

.parallax-star-3 {
  bottom: 25%;
  left: 25%;
  animation-delay: 2s;
}

.parallax-star-4 {
  top: 35%;
  right: 30%;
  animation-delay: 1.5s;
}

/* ✨ Animasi Parallax */
@keyframes float1 {
  0%, 100% { transform: translate(0, 0) scale(1); }
  33% { transform: translate(70px, -50px) scale(1.15); }
  66% { transform: translate(-50px, 60px) scale(0.95); }
}

@keyframes float2 {
  0%, 100% { transform: translate(0, 0) scale(1); }
  33% { transform: translate(-80px, 60px) scale(1.2); }
  66% { transform: translate(60px, -70px) scale(0.9); }
}

@keyframes float3 {
  0%, 100% { transform: translate(-50%, -50%) scale(1) rotate(0deg); }
  50% { transform: translate(-50%, -50%) scale(1.3) rotate(180deg); }
}

@keyframes drift1 {
  0%, 100% { transform: translate(0, 0) rotate(0deg); }
  25% { transform: translate(40px, 30px) rotate(90deg); }
  50% { transform: translate(-30px, 50px) rotate(180deg); }
  75% { transform: translate(50px, -20px) rotate(270deg); }
}

@keyframes drift2 {
  0%, 100% { transform: translate(0, 0) rotate(0deg); }
  25% { transform: translate(-50px, -40px) rotate(-90deg); }
  50% { transform: translate(30px, -60px) rotate(-180deg); }
  75% { transform: translate(-40px, 30px) rotate(-270deg); }
}

@keyframes drift3 {
  0%, 100% { transform: translate(0, 0) scale(1); }
  33% { transform: translate(60px, 40px) scale(1.2); }
  66% { transform: translate(-50px, -30px) scale(0.9); }
}

@keyframes drift4 {
  0%, 100% { transform: translate(0, 0) scale(1); }
  50% { transform: translate(-60px, 40px) scale(1.15); }
}

@keyframes twinkle {
  0%, 100% { opacity: 0.3; transform: scale(1); }
  50% { opacity: 0.8; transform: scale(1.3); }
}
</style>