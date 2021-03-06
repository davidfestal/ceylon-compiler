/*
 * Copyright Red Hat Inc. and/or its affiliates and other contributors
 * as indicated by the authors tag. All rights reserved.
 *
 * This copyrighted material is made available to anyone wishing to use,
 * modify, copy, or redistribute it subject to the terms and conditions
 * of the GNU General Public License version 2.
 * 
 * This particular file is subject to the "Classpath" exception as provided in the 
 * LICENSE file that accompanied this code.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT A
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License,
 * along with this distribution; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA  02110-1301, USA.
 */
import java.lang { JString = String, JInteger = Integer }
import java.io { File, InputStreamReader, BufferedReader }
import java.net { InetSocketAddress, URI }
import java.nio.channels { ServerSocketChannel }
import java.nio.file { 
    FileSystems,
    Files, 
    Paths, 
    StandardCopyOption
}
import java.util { HashMap }

@noanno
@error
void methods() {
    @error
    File f1 = File("file1");
    @error
    File f2 = File("file2");
    @error
    print(f1.canRead());
    Integer cmp = f1.compareTo(f2);
    @error
    f1.listFiles();
}

@error
@noanno
void overloadedMethodsAndSubClasses() {
    @error
    JavaWithOverloadedMembersSubClass inst = JavaWithOverloadedMembersSubClass();
    @error
    inst.method();
    @error
    inst.method(1);
    @error
    inst.method(1, 2);
    @error
    inst.topMethod();
}

@error
@noanno
void overloadedConstructors() {
    @error
    JavaWithOverloadedMembersSubClass inst = JavaWithOverloadedMembersSubClass();
    @error
    JavaWithOverloadedMembersSubClass inst2 = JavaWithOverloadedMembersSubClass(2);
}

@error
@noanno
class OverloadedMembersAndSubClasses() extends JavaWithOverloadedMembersSubClass() {
    void test(){
        @error
        method();
        @error
        method(1);
        @error
        method(1, 2);
        @error
        topMethod();
    }
}

@error
@noanno
class OverloadedMembersAndSubClasses2() extends JavaWithOverloadedMembersSubClass(2) {
}

@noanno
@error
void variadicMethods() {
    T box<T>(T t){return t;}
    @error
    TypesJava java = TypesJava();

    @error
    java.variadicBoolean(true, box(false), true);
    @error
    java.variadicBoolean(*{});
    @error
    java.variadicBoolean(*[true, box(false), true]);
    java.variadicBoolean(true, box(false), *[true, box(false), true]);

    @error
    java.variadicCeylonBoolean(true, box(false), true);
    @error
    java.variadicCeylonBoolean(*{});
    @error
    java.variadicCeylonBoolean(*[true, box(false), true]);

    @error
    java.variadicChar('a', box('b'), 'c');
    @error
    java.variadicChar(*{});
    @error
    java.variadicChar(*['a', box('b'), 'c']);

    @error
    java.variadicByte(1, box(2), 3);
    @error
    java.variadicByte(*{});
    @error
    java.variadicByte(*[1, box(2), 3]);
    java.variadicByte(1, *[1, box(2), 3]);
    java.variadicByte(1, box(2), *[1, box(2), 3]);

    @error
    java.variadicShort(*{});
    @error
    java.variadicShort(*[1, box(2), 3]);

    @error
    java.variadicInt(*{});
    @error
    java.variadicInt(*[1, box(2), 3]);

    @error
    java.variadicLong(1, box(2), 3);
    @error
    java.variadicLong(1);
    @error
    java.variadicLong(box(1));
    @error
    java.variadicLong();
    @error
    java.variadicLong(*{});
    @error
    java.variadicLong(*[1, box(2), 3]);
    Integer[] empty = {};
    Integer[] full = [1, 2];
    @error
    java.variadicLong(*empty);
    @error
    java.variadicLong(*full);

    java.variadicFloat(*{});
    java.variadicFloat(1.0, box(2.0), 3.0);
    java.variadicFloat(*[1.0, box(2.0), 3.0]);
    java.variadicFloat(1.0, *[1.0, box(2.0), 3.0]);
    java.variadicFloat(1.0, box(2.0), *[1.0, box(2.0), 3.0]);

    @error
    java.variadicDouble(*{});
    @error
    java.variadicDouble(*[1.0, box(2.0), 3.0]);

    @error
    java.variadicJavaString("a", box("b"), "c");
    @error
    java.variadicJavaString("a");
    @error
    java.variadicJavaString(box("a"));
    @error
    java.variadicJavaString();
    String? string = "a";
    @error
    java.variadicJavaString(string);
    @error
    java.variadicJavaString(*{});
    @error
    java.variadicJavaString(*["a", box("b"), "c"]);
    java.variadicJavaString("a", box("b"), *["a", box("b"), "c"]);

    @error
    java.variadicCeylonString("a", box("b"), "c");
    @error
    java.variadicCeylonString(*{});
    @error
    java.variadicCeylonString(*["a", box("b"), "c"]);
    String[] emptyString = {};
    String[] fullString = ["a", "b"];
    @error
    java.variadicCeylonString(*emptyString);
    @error
    java.variadicCeylonString(*fullString);

    @error
    java.variadicObject("a", box("b"), 1, box(2));
    @error
    java.variadicObject(*{});
    @error
    java.variadicObject(*["a", box("b"), 1, box(2)]);

    @error
    java.variadicObject(JString("a"), JInteger(1));
    @error
    java.variadicObject(*[JString("a"), JInteger(1)]);
    
    @error
    java.variadicT<Integer>(1, box(2), 3);
    @error
    java.variadicT<Integer>(*{});
    @error
    java.variadicT<Integer>(*[1, box(2), 3]);
    Integer[] sequence = [1, box(2), 3];
    @error
    java.variadicT<Integer>(*sequence);
    java.variadicT<Integer>(1, box(2), *sequence);

    @error
    java.variadicT<String>("a", box("b"), "c");
    
    java.variadicObject(for (i in 1..2) i);
    java.variadicInt(for (i in 1..2) i);
}

@noanno
void tupleSpreading(){
    TypesJava java = TypesJava();
    value tuple = [true, 1, 2, 3, 4, 5.0, 6.0, 'a', "foo", java];
    java.takeAll(true, 1, 2, 3, 4, 5.0, 6.0, 'a', "foo", java);
    // full spread
    java.takeAll(*tuple);
    // partial spread
    java.takeAll(true, *tuple.rest);
    value tuple2 = [true, 1, 'a', 'b', 'c'];
    // full spread including variadic
    java.takeAllVariadic(*tuple2);
    // partial spread including variadic
    value tuple3 = ['c', 'd'];
    java.takeAllVariadic(true, 1, 'a', 'b', *tuple3);
}

@noanno
void comprehensions(){
    TypesJava java = TypesJava();
    java.variadicFloat(*{for (i in 1..2) 2.0});
    java.variadicFloat(1.0, *{for (i in 1..2) 2.0});
    java.variadicFloat(*[for (i in 1..2) 2.0]);
    java.variadicFloat(1.0, *[for (i in 1..2) 2.0]);
}

@noanno
void moreOverloads(){
    FileSystems.newFileSystem(URI.create(""), HashMap<JString,Object>());
    BufferedReader(InputStreamReader(null));
    ServerSocketChannel.open().bind(InetSocketAddress("",1));
    Files.copy(Paths.get(URI("", "", "")), Paths.get(URI("")), StandardCopyOption.\iATOMIC_MOVE, 
            *{StandardCopyOption.\iREPLACE_EXISTING, StandardCopyOption.\iCOPY_ATTRIBUTES});

}