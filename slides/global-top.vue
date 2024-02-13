<template>
  <header v-if="!['image-right', 'end'].includes($slidev.nav.currentLayout)">
    <div class="absolute top-0 left-0 right-0 mb-2 flex flex-row  justify-end p-4">
      <img class="w-36" src="./assets/images/logo-light.svg" alt="logo" />
    </div>
  </header>
</template>
