# org.shaneking

ShaneKing Java Library

## Specification

### Package

#### Process Flow Layer

the layers like car, A classes, B classes, C classes, A0 classes, A1 classes, A00 classes(WuLingHongGuang MINI EV)

##### Process Flow

- AbCdE`f`GhI`j`KlM`n`OpQ`r`StU`v`WxYz
  - @Controller -> @Service -> @Repository
  - b -> d -> f -> ... -> v -> x -> z
  - A -> C -> E -> ... -> U -> W -> Y
- 123456789
  - 6 Helper(@Component), 8 Utils(Statics)

##### Layer

- stub(no dependency): used for caller. Dicts, Constants, ErrorCodes etc.
  - bean: XxxBean, XxxHt2pBean, XxxCloudBean, XxxDubboBean
  - kafka: Kafka Message Body Struct
  - dubbo: maybe if no dependency or bean dependency
- api(by dependency): call for caller. ht2p, cloud, dubbo etc.
- application(implements)
  - BEGIN
    - f5j5filter
  - f5n5xxx(Access Layer): XxxServlet, XxxSocket, XxxDubbo
    - **g5**.cfg: XxxCfg
    - j5f5interceptor
    - j5j5advice
  - j5n5controller(Control Layer): XxxController
    - j5r5rr(Request And Response): XxxRr
    - n5j5transactional(Transactional Layer): XxxTransactional
  - n5n5service(Business Layer): XxxService(Biz)
    - n5r5rc(Remote Call): XxxRc
  - r5n5repository(Database Layer): XxxRepository(Dao)
    - **u5**.entity: XxxEntity
  - END

### Class

#### Order

- field (excluding serialized objects like ORM entitys)
  - static -> non-static
  - final -> non-final
  - public -> protect -> private
  - base type -> object type
  - type name
  - name
- method
  - static -> non-static
  - public -> protect -> private
  - name
  - arg type name (ignore case)
- tests
  - group by arg type name (ignore case)
  - arg value (by ascii: special -> symbol -> 0-9 -> A-Z -> a-z)

### Annotation

#### Order

- RR : 12345
- Transactional : 123456

### Method

#### Special Getter/Setter Method Name Prefix

- **gna**: get null able
- **gnn**: get not null
- **sin**: set if null
- **srn**: set (and) return new
- **sro**: set (and) return old
- **srt**: set (and) return this
- **srv**: set (and) return void
