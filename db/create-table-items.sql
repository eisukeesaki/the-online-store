-- ITEMS
CREATE TABLE items (
    id UUID
        PRIMARY KEY
        DEFAULT gen_random_uuid(),
    title
        VARCHAR(50),
    description
        VARCHAR(9999),
    price
        NUMERIC(4,2),
    created
        TIMESTAMP
        NOT NULL
        DEFAULT (CURRENT_TIMESTAMP), 
    modified
        TIMESTAMP
);
CREATE TRIGGER update_items_modtime
    BEFORE UPDATE
    ON items
    FOR EACH ROW
        EXECUTE PROCEDURE update_modified_column();

INSERT INTO items
    (id, title, description, price)
    VALUES
        ('4fc3f9cf-f42d-489e-8079-ee06cefeccc0', 'Seabream Whole Farmed', 'Duis mattis egestas metus.', 63.55),
        ('52fbe18d-1bc7-4f76-8da3-2f1a41321cde', 'Crackers - Trio', 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 8.45),
        ('629adaa2-3d72-40b7-b093-255d820562bd', 'Flour - Strong', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', 52.13),
        ('d346cd9d-7ad6-4ea8-afa3-3f5e1be94711', 'Bacardi Limon', 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.', 80.07),
        ('84ad294b-631e-492a-bdec-c3063cd96f43', 'Cheese - Mix', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', 12.6),
        ('28d66a62-97c2-4b99-b6ee-81a7d067f4dc', 'Towel - Roll White', 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', 37.17),
        ('b0bdf92b-2fde-43e6-8c73-c09d8a80fbc2', 'Greens Mustard', 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.', 98.09),
        ('47cf1735-4392-4978-adfa-4757dfd5cc07', 'Cup - 8oz Coffee Perforated', 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 49.42),
        ('d5fac0f0-3f62-48aa-b807-5ed4722c27da', 'Jameson Irish Whiskey', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 38.31),
        ('cd69da07-9392-40d2-a838-dc3e97268a41', 'Squid - U - 10 Thailand', 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', 72.17),
        ('9120147c-4d56-4e1b-8ce1-7350a9d58791', 'Red Snapper - Fresh, Whole', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 54.99),
        ('4e444b53-0413-4bc5-9e97-ce6d06d155e9', 'Squash - Pattypan, Yellow', 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 15.59),
        ('ed197b35-a289-478b-9e5f-b3cae8a2dba6', 'Wine - Red, Pinot Noir, Chateau', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus.', 44.92),
        ('849b46c1-c273-496e-9cd2-f114ec7181b9', 'Island Oasis - Lemonade', 'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 53.61),
        ('8d4ad259-d46c-4e8e-8525-237372e7af50', 'Maintenance Removal Charge', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 82.46),
        ('87f3b971-a3fc-4f45-a450-fad04711163f', 'Cake - Cake Sheet Macaroon', 'Suspendisse ornare consequat lectus.', 36.8),
        ('d9e1bb49-9961-40e3-98d6-c63de979a2a3', 'Fish - Bones', 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 36.38),
        ('720e28d5-1a65-4d8a-8ae5-36991c6e67fa', 'Cardamon Seed / Pod', 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 51.05),
        ('7237a934-6fca-4fc5-9a67-c5b5990cb654', 'Bacardi Raspberry', 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 22.17),
        ('23692c1f-b81a-40ff-aebb-6b41e1d2a5c9', 'Beef - Shank', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 52.38),
        ('1fc01b80-1cf9-45c1-b188-65468d98fbb3', 'Cheese - Cream Cheese', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 98.4),
        ('9f216b3e-1731-4c05-ad6f-f0547e0599f6', 'Sauce - Rosee', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 31.83),
        ('da0060bc-17c2-476d-a7c3-26a99567d750', 'Coffee - Egg Nog Capuccino', null, 47.56),
        ('fdcda509-7e49-44d2-aec7-9f010fe1039a', 'Tendrils - Baby Pea, Organic', 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 40.24),
        ('b87cc1f0-9bff-40ed-bafe-3a6273d5a5e5', 'Cheese - Cheddar With Claret', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', 42.23),
        ('7308394f-8713-44ab-aae6-fa4fd12262c7', 'Syrup - Monin - Granny Smith', 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 26.71),
        ('a8bbbbb9-e67f-4a29-abc1-a268d80c8d99', 'Pork - Bacon, Sliced', 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', 94.19),
        ('06165693-a446-41b2-9bf4-9eefed4edc2c', 'Chicken - Tenderloin', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 62.91),
        ('256cb48c-d5be-4159-b410-cce11f0ec298', 'Chocolate Bar - Coffee Crisp', 'Nulla tellus. In sagittis dui vel nisl.', 95.09),
        ('f221efb8-cb35-47c7-be04-84e0f2c56ddf', 'Beef - Kindney, Whole', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 58.06),
        ('4c815e28-1f92-4a1d-924b-4bb253c740a6', 'Emulsifier', 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 69.37),
        ('989689fc-7240-4d8e-b8df-8352e684e601', 'Sauerkraut', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', 8.32),
        ('54dc0bc0-753a-4e83-b626-a523a84ad97c', 'Towel Dispenser', 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 83.65),
        ('834a497e-8367-44b0-95d0-beea3abb915c', 'Beef - Sushi Flat Iron Steak', null, 77.55),
        ('125f6e83-b74b-4f88-9d8e-7e170809df16', 'Sugar - Crumb', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 34.72),
        ('57ba3e90-cc1c-41d7-8683-669af7c68429', 'Sugar - Brown', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 54.18),
        ('abc586f8-44a2-4184-a599-02ab4d1883ed', 'Graham Cracker Mix', 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 18.23),
        ('b30c6d93-a24e-47c2-8e4b-52de45fa31de', 'Cheese - Brie', 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 33.84),
        ('ec1f4290-5bb2-4108-985b-8811beefea83', 'Nut - Hazelnut, Ground, Natural', 'Maecenas ut massa quis augue luctus tincidunt.', 87.9),
        ('45a0da8d-6980-4aa5-81f3-5cd9071340a0', 'Coffee - Espresso', 'Maecenas ut massa quis augue luctus tincidunt.', 78.12),
        ('3f6ecba6-a30a-44e8-a745-1112fb4ffa11', 'Wiberg Cure', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 80.14),
        ('d6b0cfbd-0bc3-42da-8f0f-5d8e9a847fc5', 'Wine - Rubyport', 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', 6.41),
        ('6bf54eb7-6010-405e-82c7-76df766f47e4', 'Wine - Red, Cabernet Sauvignon', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 68.96),
        ('215451ab-94f8-4cc2-bb67-c00b3e7f10ac', 'Oil - Coconut', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', 84.7),
        ('03073104-3e7d-4d35-99e6-4b69ed52ff8c', 'Milk - 2%', 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 82.51),
        ('5797a451-7fc2-4e90-9b57-6dde6f926881', 'Wine - Riesling Dr. Pauly', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', 4.5),
        ('0f80f032-3b4d-4e3e-98bb-f79555386d89', 'Sea Urchin', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 21.34),
        ('1c4f283c-2980-400d-938a-dd5faf9832f7', 'Oil - Olive', null, 55.51),
        ('ab79c41f-d1cb-4030-8466-a761373c5605', 'Butter - Pod', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 9.7),
        ('509eaf72-87d1-4fec-97cd-24a916025aa5', 'Sauce - Bernaise, Mix', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 90.35);
