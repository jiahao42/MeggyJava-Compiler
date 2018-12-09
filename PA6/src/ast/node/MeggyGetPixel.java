/* This file was generated by SableCC (http://www.sablecc.org/). 
 * Then modified.
 */

package ast.node;

import ast.visitor.*;

@SuppressWarnings("nls")
public final class MeggyGetPixel extends IExp
{
    private IExp _x_exp_;
    private IExp _y_exp_;

    public MeggyGetPixel(int _line_, int _pos_, IExp _x_exp_, IExp _y_exp_)
    {
        super(_line_, _pos_);
        setXExp(_x_exp_);
        setYExp(_y_exp_);
    }

    @Override
    public int getNumExpChildren() { return 2; }
    
    @Override
    public Object clone()
    {
        return new MeggyGetPixel(
                this.getLine(),
                this.getPos(),
                this._x_exp_,this._y_exp_);
    }

    public void accept(Visitor v)
    {
        v.visitMeggyGetPixel(this);
    }

    public IExp getXExp()
    {
        return this._x_exp_;
    }

    public IExp getYExp()
    {
        return this._y_exp_;
    }

    public void setXExp(IExp node)
    {
        if(this._x_exp_ != null)
        {
            this._x_exp_.parent(null);
        }

        if(node != null)
        {
            if(node.parent() != null)
            {
                node.parent().removeChild(node);
            }

            node.parent(this);
        }

        this._x_exp_ = node;
    }

    public void setYExp(IExp node)
    {
        if(this._y_exp_ != null)
        {
            this._y_exp_.parent(null);
        }

        if(node != null)
        {
            if(node.parent() != null)
            {
                node.parent().removeChild(node);
            }

            node.parent(this);
        }

        this._y_exp_ = node;
    }

    @Override
    void removeChild(Node child)
    {
        // Remove child
        if(this._x_exp_ == child)
        {
            this._x_exp_ = null;
            return;
        }

        if(this._y_exp_ == child)
        {
            this._y_exp_ = null;
            return;
        }

        throw new RuntimeException("Not a child.");
    }

    @Override
    void replaceChild(Node oldChild, Node newChild)
    {
        // Replace child
        if(this._x_exp_ == oldChild)
        {
            setXExp((IExp) newChild);
            return;
        }

        if(this._y_exp_ == oldChild)
        {
            setYExp((IExp) newChild);
            return;
        }

        throw new RuntimeException("Not a child.");
    }
}