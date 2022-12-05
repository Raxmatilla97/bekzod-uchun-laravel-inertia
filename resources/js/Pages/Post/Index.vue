<template>

    <h1 class="text-lg mb-8">Postlar</h1>
    <div class="mb-8">
        <Link
            :href="route('post.create')"
            class="hover:bg-white hover:text-gray-500 border border-sky-500 block p-2 w-32 bg-sky-500 rounded-full
            text-center text-white">
            Post qo'shish
        </Link>
    </div>
    <div v-if="posts">
        <div v-for="post in posts" class="mt-8 pt-8 border-t border-gray-300">
            <div> ID: {{ post.id }}</div>
            <div> Nomlanishi: {{ post.title }}</div>
            <div> Content: {{ post.content }}</div>
            <div class="text-sm text-right"> Yaratilgan: {{ post.date }}</div>
            <div class="text-sm text-right">
                <Link :href="route('post.show', post.id)" class="text-sky-500">Ko'rish</Link>
            </div>
            <div class="text-sm text-right">
                <Link :href="route('post.edit', post.id)" class="text-sky-500">O'zgartirish</Link>
            </div>
            <div class="text-sm text-right">
                <p @click="deletePost(post.id)" class="cursor-pointer text-red-500">O'chirish</p>
            </div>

        </div>
    </div>


</template>

<script>
import {Link} from "@inertiajs/inertia-vue3";
import MainLayout from "@/Layouts/MainLayout.vue";

export default {
    name: "index",
    layout: MainLayout,
    props: [
        'posts'
    ],
    components: {
        Link
    },
    methods: {
        deletePost(id) {
            this.$inertia.delete(`/posts/${id}`)
        }
    }

}
</script>

<style scoped>

</style>
