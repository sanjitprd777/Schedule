"use strict"

const routes = {
    '/' : Home,
    '/interviews' : Interviews,
    '/interviews/new' : New,
    '/interviews/:id/edit' : Edit,
    '/interviews/:id' : Show,
    '/views/errors/not_found' : Error404
}

const router = async () => {

    const header = null || document.getElementById('header_container');
    const content = null || document.getElementById('page_container');
    const footer = null || document.getElementById('footer_container');

    header.innerHTML = await Navbar.render();
    await Navbar.after_render();
    footer.innerHTML = await Bottombar.render();
    await Bottombar.after_render();

    const request = Utils.parseRequestURL();

    const parsedURL = (request.resource ? '/' + request.resource : '/') + 
                    (request.id ? '/:id' : '') + 
                    (request.verb ? '/' + request.verb : '');

    const page = routes[parsedURL] ? routes[parsedURL] : Error404;
    
    content.innerHTML = await page.render();

    await page.after_render();

}

window.addEventListener('hashchange', (event) => {
    console.log('hashchanged');
    router(event);
});
// window.addEventListener('hashchange', router);

window.addEventListener('load', router);