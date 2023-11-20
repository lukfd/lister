<script setup>
import Toolbar from 'primevue/toolbar'
</script>

<template>
    <Toolbar :pt="{ root: { class: 'border-none' } }">
        <template #start>
            <img href="/logo_skaffale.svg" height="10%" />
            <p class="font-bold text-lg">Skaffale.com</p>
        </template>

        <template #end>
        </template>
    </Toolbar>
</template>

<style scoped>
</style>
