<template>

    <h1 class="text-lg mb-2">Postlarni yaratish</h1>
    <div class="mb-8">
        <Link :href="route('post.index')" class="text-sky-500 text-sm mb-8">
            Orqaga
        </link>
    </div>

    <form method="POST" @submit.prevent="store">

        <div class="mb-4">
            <input v-model="title" class="w-full rounded-full border-gray-300" type="text" placeholder="Title">
            <div v-if="errors.title" class="text-red-600 text-sm"> {{ errors.title }}</div>
        </div>
        <div class="mb-2">
                    <textarea v-model="content" class="w-full rounded-lg border-gray-300" placeholder="Content"
                              cols="30" rows="10"></textarea>
            <div v-if="errors.content" class="text-red-600 text-sm"> {{ errors.content }}</div>
        </div>
        <div class="mb-4">
            <button class="hover:bg-white hover:text-gray-500 border border-sky-500 block p-2 w-32 bg-sky-500 rounded-full
            text-center text-white m-auto" type="submit">Yuborish
            </button>
        </div>
    </form>


</template>

<script>
import {Link} from "@inertiajs/inertia-vue3";
import MainLayout from "@/Layouts/MainLayout.vue";

export default {
    name: "index",
    layout: MainLayout,
    components: {
        Link
    },
    props: [
        'errors'
    ],
    data() {
        return {
            title: '',
            content: '',
        }
    },
    methods: {
        store() {
            this.$inertia.post(route('post.store'), {
                title: this.title,
                content: this.content
            })
        }

    }

}
</script>

<style scoped>

</style>
