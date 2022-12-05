<template>

    <h1 class="text-lg mb-2">Postni o'zgartirish</h1>
    <div class="mb-8">
        <Link :href="route('post.index')" class="text-sky-500 text-sm mb-8">
            Orqaga
        </link>
    </div>

    <form method="POST" @submit.prevent="update">

        <div class="mb-4">
            <input v-model="title" class="w-full rounded-full border-gray-300" type="text" placeholder="title">
        </div>
        <div class="mb-2">
                    <textarea v-model="content" class="w-full rounded-lg border-gray-300" aria-placeholder="content"
                              cols="30" rows="10">{{ post.content }}</textarea>
        </div>
        <div class="mb-4">
            <button class="hover:bg-white hover:text-gray-500 border border-sky-500 block p-2 w-32 bg-sky-500 rounded-full
            text-center text-white m-auto" type="submit">O'zgartirish
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
        'post'
    ],
    data() {
        return {
            id: this.post.id,
            title: this.post.title,
            content: this.post.content,
        }
    },
    methods: {
        update() {
            this.$inertia.patch(`/posts/${this.id}`, {
                title: this.title,
                content: this.content
            })
        }

    }

}
</script>

<style scoped>

</style>
